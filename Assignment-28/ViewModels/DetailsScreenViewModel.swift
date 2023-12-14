//
//  DetailsScreenViewModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import Foundation

final class DetailsScreenViewModel: ObservableObject {
    //MARK: - Properties
    private var networkManager: NetworkManager
    @Published var travelDestinations: [TopWinterDestination] = []
    
    
    
    //MARK: - Init
    init() {
        self.networkManager = NetworkManager(baseURL: "https://mocki.io/v1/")
        
        fetchDestinationDetails()
    }
    
    func fetchDestinationDetails() {
        networkManager.fetchData(endpoint: "2e196633-1137-4b41-a190-5374539b5cd3") { (result: Result<DestinationModel, Error>) in
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
}
