//
//  DestinationModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import Foundation

// MARK: - Destination
struct DestinationModel: Decodable, Hashable {
    //    var id = UUID() / Identifable
    let topWinterDestinations: [TopWinterDestination]
}

// MARK: - TopWinterDestination
struct TopWinterDestination: Decodable, Hashable {
    //    var id = UUID()
    let image: String
    let location: String
    let dealDeadline: String
    let info: String
    let details: Details
}

// MARK: - Details
struct Details: Decodable, Hashable {
    let transport: [Transport]
    let mustSee: [MustSee]
    let hotels: [Hotel]
    let generalInfo: String
    
    enum CodingKeys: String, CodingKey {
        case transport = "Transport"
        case mustSee = "MustSee"
        case hotels = "Hotels"
        case generalInfo = "GeneralInfo"
    }
}

// MARK: - Hotel
struct Hotel: Decodable, Hashable {
    let name: String
    let rating: Int
    let details: String
}

// MARK: - MustSee
struct MustSee: Decodable, Hashable {
    let place: String
    let details: String
}

// MARK: - Transport
struct Transport: Decodable, Hashable {
    let mode: String
    let details: String
}
