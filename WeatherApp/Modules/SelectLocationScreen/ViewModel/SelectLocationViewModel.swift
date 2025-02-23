//
//  SelectLocationViewModel.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 21.02.2025.
//

import SwiftUI

@MainActor
final class SelectLocationViewModel: ObservableObject {
    @Published var cityName = ""
    @Published var weatherInfo: WeatherInfo?
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var showErrorAlert = false
    
    private let apiService: APIServiceType

    init(apiService: APIServiceType = APIService()) {
        self.apiService = apiService
    }
    
    func fetchWeather() async {
        guard let cityName = validateCityName() else {
            showError("City name cannot be empty")
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
        
        let params = constructParams(for: cityName)
        
        do {
            async let weather = apiService.response(from: CurrentWeatherRequest(params))
            async let forecast = apiService.response(from: ForecastRequest(params))
            
            self.weatherInfo = WeatherInfo(current: try await weather, forecast: try await forecast)
        } catch {
            handleError(error)
        }
    }
    
    private func validateCityName() -> String? {
        let trimmedCity = cityName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedCity.isEmpty ? nil : trimmedCity
    }
    
    private func constructParams(for cityName: String) -> [String: String] {
        return [
            "q": cityName,
            "appid": Constants.API.API_KEY,
            "units": "metric"
        ]
    }
    
    private func handleError(_ error: Error) {
        if let apiError = error as? APIServiceError {
            showError(apiError.localizedDescription)
        } else {
            showError("Unexpected error occurred.")
        }
    }
    
    private func showError(_ message: String) {
        errorMessage = message
        showErrorAlert = true
    }
}
