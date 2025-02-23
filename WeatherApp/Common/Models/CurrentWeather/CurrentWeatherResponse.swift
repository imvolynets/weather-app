//
//  CurrentWeatherResponse.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    let dt: Int?
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let rain: Rain?
    
    var currentDate: String {
        let newTime = Date(timeIntervalSince1970: TimeInterval(dt ?? Int(Date().timeIntervalSince1970)))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, d"
        return dateFormatter.string(from: newTime)
    }
}
