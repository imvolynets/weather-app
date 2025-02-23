//
//  Rain.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

struct Rain: Decodable {
    let the3H: Double?
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
        case the1H = "1h"
    }
}
