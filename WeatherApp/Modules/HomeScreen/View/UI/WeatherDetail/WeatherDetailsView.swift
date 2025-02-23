//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct WeatherDetailsView: View {
    let humidity: Int?
    let windSpeed: Double?
    let rain: Double?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.richBlack.opacity(0.3))
                .shadow(color: Color.black.opacity(0.25), radius: 29, x: 0, y: 0)
            HStack(spacing: 30) {
                if let rain = rain {
                    WeatherDetailView(icon: .rainIcon, value: "\(Int(rain.rounded()))%")
                }
                
                WeatherDetailView(icon: .humidityIcon, value: "\(humidity ?? 0)%")
                WeatherDetailView(icon: .windIcon, value: "\(Int(windSpeed?.rounded() ?? 0.0)) km/h")
            }.padding(.vertical, 12)
        }
    }
}
