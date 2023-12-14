//
//  MainScreenViewModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    //MARK: - Properties
    private var networkManager: NetworkManager
    @Published var travelDestinations: [TopWinterDestination] = []
    
    
    @Published var travelTips: [String] = []
    
    //MARK: - Init
    init() {
        self.networkManager = NetworkManager(baseURL: "https://mocki.io/v1/")
        
        fetchTravelDestinations()
        fetchTravelTips()
    }
    
    func fetchTravelDestinations() {
        networkManager.fetchData(endpoint: "2b987ee7-0537-4500-a97b-23553e0b8821") { (result: Result<DestinationModel, Error>) in
            switch result {
            case .success(let destinations):
                DispatchQueue.main.async {
                    self.travelDestinations = destinations.topWinterDestinations
                }
                print("Fetched items: \(destinations)")
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchTravelTips() {
        networkManager.fetchData(endpoint: "c56f0d84-7989-413b-a74b-faffe5625eb5") { (result: Result<TipModel, Error>) in
            switch result {
            case .success(let tips):
                DispatchQueue.main.async {
                    self.travelTips = tips.travelTips
                }
                print("Fetched items: \(tips)")
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
    
    func getRandomTipsAlert() -> String {
        let randomIndex = Int.random(in: 0..<travelTips.count)
        return travelTips[randomIndex]
    }
}
