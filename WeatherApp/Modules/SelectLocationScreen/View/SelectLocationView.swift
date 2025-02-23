//
//  SelectLocationView.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

struct SelectLocationView: View {
    @StateObject private var viewModel = SelectLocationViewModel()
    @State private var shouldNavigate = false
    @State private var keyboardHeight: CGFloat = 96

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.container)
            
            VStack {
                HStack(spacing: 13) {
                    Text("w_letter")
                        .font(.appFont(style: .bold, size: 96))
                        .foregroundColor(.customRed)
                    
                    VStack(alignment: .leading) {
                        Text("weather_label")
                            .font(.appFont(style: .medium, size: 30))
                            .foregroundColor(.black)
                        
                        Text("app_label")
                            .font(.appFont(style: .medium, size: 30))
                            .foregroundColor(.black.opacity(0.5))
                    }
                }
                
                Image(.sunAndRain)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.silver)
                            .frame(height: 47)
                        
                        HStack {
                            Image(.searchIcon)
                                .padding(.leading, 17)
                            
                            TextField("", text: $viewModel.cityName, prompt: Text(String(localized: "search_city_label")).foregroundColor(.black.opacity(0.5)))
                                .frame(height: 47)
                                .font(.appFont(size: 14))
                                .foregroundColor(.black.opacity(0.5))
                        }
                    }
                    
                    Button(action: {
                        Task {
                            await viewModel.fetchWeather()
                            if viewModel.weatherInfo != nil && viewModel.errorMessage == nil {
                                shouldNavigate = true
                            }
                        }
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.black.opacity(0.5))
                            .padding()
                        } else {
                            Text("check_button")
                                .foregroundColor(.white)
                                .padding()
                                .font(.appFont(size: 16))
                                .background(Color.oxfordBlue)
                                .cornerRadius(20)
                        }
                    }
                }.navigationDestination(isPresented: $shouldNavigate) {
                    HomeView(weatherData: viewModel.weatherInfo)
                }
            }.keyboardHeight($keyboardHeight)
                .animation(.easeOut(duration: 0.3), value: keyboardHeight)
                .offset(y: -keyboardHeight / 2)
                .padding(.top, 76)
                .padding(.leading, 36)
                .padding(.trailing, 29)
            
        }.onTapGesture {
            self.endEditing()
        }.alert("Error", isPresented: $viewModel.showErrorAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "An unknown error occurred")
        }
    }
}
