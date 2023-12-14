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
    let location: String
    let dealDeadline: String
    let info: String
}






//
//struct Destination: Decodable {
////    let id = UUID()
//    let location: String
//    let dealDeadline: String
//    let info: String
//}
//




//
//struct TravelDestinationList {
//    static let topWinterDestinations = [
//        Destination(
//            location: "🇨🇭 Zurich, Switzerland",
//            dealDeadline: "13/12/23",
//            info: "5 nights, 4 days, 5-star hotel"
//        ),
//        Destination(
//            location: "🇨🇦 Banff, Canada",
//            dealDeadline: "14/01/24",
//            info: "6 nights, 5 days, mountain resort"
//        ),
//        Destination(
//            location: "🇯🇵 Hokkaido, Japan",
//            dealDeadline: "13/12/23",
//            info: "7 nights, 6 days, winter festivals"
//        ),
//        Destination(
//            location: "🇦🇹 Vienna, Austria",
//            dealDeadline: "14/01/24",
//            info: "4 nights, 3 days, cultural experience"
//        ),
//        Destination(
//            location: "🇳🇴 Oslo, Norway",
//            dealDeadline: "13/12/23",
//            info: "5 nights, 4 days, northern lights tour"
//        ),
//        Destination(
//            location: "🇳🇿 Queenstown, New Zealand",
//            dealDeadline: "14/01/24",
//            info: "8 nights, 7 days, adventure activities"
//        ),
//        Destination(
//            location: "🇸🇪 Stockholm, Sweden",
//            dealDeadline: "13/12/23",
//            info: "6 nights, 5 days, historic sites"
//        ),
//        Destination(
//            location: "🇩🇪 Munich, Germany",
//            dealDeadline: "14/01/24",
//            info: "4 nights, 3 days, Christmas markets"
//        ),
//        Destination(
//            location: "🇫🇮 Rovaniemi, Finland",
//            dealDeadline: "13/12/23",
//            info: "7 nights, 6 days, Santa Claus Village"
//        ),
//        Destination(
//            location: "🇮🇸 Reykjavik, Iceland",
//            dealDeadline: "14/01/24",
//            info: "5 nights, 4 days, geothermal wonders"
//        )
//    ]
//}
