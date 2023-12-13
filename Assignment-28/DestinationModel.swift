//
//  DestinationModel.swift
//  Assignment-28
//
//  Created by Eka Kelenjeridze on 13.12.23.
//

import Foundation

struct Destination: Identifiable {
    let id = UUID()
    let country: String
    let dealDeadline: String
    let info: String
}


struct TravelDestinationList {
    static let topWinterDestinations: [Destination] = [
        Destination(
            country: "🇨🇭 Zurich, Switzerland",
            dealDeadline: "13/12/23",
            info: "5 nights, 4 days, 5-star hotel"
        ),
        Destination(
            country: "🇨🇦 Banff, Canada",
            dealDeadline: "14/01/24",
            info: "6 nights, 5 days, mountain resort"
        ),
        Destination(
            country: "🇯🇵 Hokkaido, Japan",
            dealDeadline: "13/12/23",
            info: "7 nights, 6 days, winter festivals"
        ),
        Destination(
            country: "🇦🇹 Vienna, Austria",
            dealDeadline: "14/01/24",
            info: "4 nights, 3 days, cultural experience"
        ),
        Destination(
            country: "🇳🇴 Oslo, Norway",
            dealDeadline: "13/12/23",
            info: "5 nights, 4 days, northern lights tour"
        ),
        Destination(
            country: "🇳🇿 Queenstown, New Zealand",
            dealDeadline: "14/01/24",
            info: "8 nights, 7 days, adventure activities"
        ),
        Destination(
            country: "🇸🇪 Stockholm, Sweden",
            dealDeadline: "13/12/23",
            info: "6 nights, 5 days, historic sites"
        ),
        Destination(
            country: "🇩🇪 Munich, Germany",
            dealDeadline: "14/01/24",
            info: "4 nights, 3 days, Christmas markets"
        ),
        Destination(
            country: "🇫🇮 Rovaniemi, Finland",
            dealDeadline: "13/12/23",
            info: "7 nights, 6 days, Santa Claus Village"
        ),
        Destination(
            country: "🇮🇸 Reykjavik, Iceland",
            dealDeadline: "14/01/24",
            info: "5 nights, 4 days, geothermal wonders"
        )
    ]


}
