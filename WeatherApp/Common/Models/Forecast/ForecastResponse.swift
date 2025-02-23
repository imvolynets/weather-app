//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

struct ForecastResponse: Decodable {
    let list: [Forecast]
}

extension ForecastResponse {
    func forecastsForToday() -> [Forecast] {
        let todayDateString = Date().toDateString()
        return list.filter { $0.dtTxt.starts(with: todayDateString) }
    }
}

extension Date {
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"  // Format to match `dtTxt`
        return formatter.string(from: self)
    }
}
