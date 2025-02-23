//
//  Forecast.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

struct Forecast: Decodable, Identifiable {
    let dt: Int?
    let main: Main
    let weather: [Weather]
    let dtTxt: String
    
    var id: Int { dt ?? UUID().hashValue }
    
    var time: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: dtTxt) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case dtTxt = "dt_txt"
    }
}

