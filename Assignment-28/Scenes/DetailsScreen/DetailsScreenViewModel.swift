//
//  DetailsScreenViewModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import Foundation

final class DetailsScreenViewModel: ObservableObject {
    //MARK: - Properties
    @Published var destination: TopWinterDestination
    
    init(destination: TopWinterDestination) {
        self.destination = destination
    }
}
