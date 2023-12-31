//
//  TipModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 14.12.23.
//

import Foundation

// MARK: - Tip
struct TipModel: Decodable, Hashable {
    let travelTips: [String]

    enum CodingKeys: String, CodingKey {
        case travelTips = "travel_tips"
    }
}
