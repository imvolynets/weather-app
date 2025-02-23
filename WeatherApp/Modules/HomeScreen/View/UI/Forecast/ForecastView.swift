//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct ForecastView: View {
    let weatherData: WeatherInfo?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.richBlack.opacity(0.3))
                .shadow(color: Color.black.opacity(0.25), radius: 29, x: 0, y: 0)
            VStack(spacing: 12){
                HStack {
                    Text("today_label")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text("\(weatherData?.current.currentDate ?? "")")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(weatherData?.forecast.forecastsForToday() ?? []) { weather in
                            HourlyWeatherView(weather: weather)
                        }
                    }
                }
            }.padding(.horizontal).padding(.top, 12).padding(.bottom, 14)
        }
    }
}
