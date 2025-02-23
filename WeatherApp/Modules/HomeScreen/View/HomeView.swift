//
//  HomeView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let weatherData: WeatherInfo?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.oxfordBlue, Color.sapphire, Color.cobaltBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            ScrollView {
                VStack {
                    ZStack {
                        if let iconCode = weatherData?.current.weather.first?.icon {
                            WeatherIconView(iconCode: iconCode)
                                .padding(.top, -30)
                                .padding(.bottom, -50)
                        }
                        
                        VStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack(spacing: 12) {
                                    Image(.mapIcon)
                                    Text(weatherData?.current.name ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    Text("\(Int(weatherData?.current.main.temp?.rounded() ?? 0.0))º")
                        .foregroundColor(.white)
                        .font(.system(size: 64, weight: .semibold))
                        .padding(.bottom, 5)
                    
                    Text("precipitations")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
                    Text("Max.: \(Int(weatherData?.current.main.tempMax?.rounded() ?? 0.0))º   Min.: \(Int(weatherData?.current.main.tempMin?.rounded() ?? 0.0))º")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.bottom, 30)
                    VStack(spacing: 20) {
                        WeatherDetailsView(humidity: weatherData?.current.main.humidity, windSpeed: weatherData?.current.wind.speed.metersPerSecondToKilometersPerHour, rain: weatherData?.current.rain?.the1H ?? weatherData?.current.rain?.the3H)
                        ForecastView(weatherData: weatherData)
                    }.padding(.bottom, 30)
                    
                }.padding(.horizontal, 40).padding(.vertical, 20)
            }.scrollIndicators(.hidden).scrollBounceBehavior(.basedOnSize)
        }
    }
}
