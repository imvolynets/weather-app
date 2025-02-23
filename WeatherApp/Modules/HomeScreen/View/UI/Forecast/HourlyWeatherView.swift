//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct HourlyWeatherView: View {
    let weather: Forecast
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(Int(weather.main.temp?.rounded() ?? 0.0))ºC")
                .foregroundColor(.white)
                .font(.system(size: 18))
            
            WeatherIconView(iconCode: weather.weather.first?.icon ?? "")
                .frame(width: 50, height: 50)
            Text(weather.time ?? "")
                .foregroundColor(.white)
                .font(.system(size: 18))
        }
    }
}
