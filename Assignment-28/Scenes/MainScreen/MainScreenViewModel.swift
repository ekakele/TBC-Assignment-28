//
//  MainScreenViewModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import SwiftUI

final class MainScreenViewModel: ObservableObject {
    //MARK: - Properties
    private var networkManager: NetworkManager
    @Published var travelDestinations: [TopWinterDestination] = []
    @Published var travelTips: [String] = []
    @Published var downloadedImage: UIImage? = nil
    
    //MARK: - Init
    init() {
        self.networkManager = NetworkManager(baseURL: "https://mocki.io/v1/")
        
        fetchTravelDestinations()
        fetchTravelTips()
    }
    
    func fetchTravelDestinations() {
        networkManager.fetchData(endpoint: "2bbe2b00-e979-4c2a-90a5-fcad455b5df5") { (result: Result<DestinationModel, Error>) in
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
