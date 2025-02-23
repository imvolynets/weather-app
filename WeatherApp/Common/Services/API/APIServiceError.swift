//
//  APIServiceError.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

enum APIServiceError: Error, LocalizedError {
    case noInternetConnection
    case responseError
    case decodingError
    case invalidURL
    case unknownError(Error)
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet Connection. Please check your network."
        case .responseError:
            return "Invalid server response. Please try again later."
        case .decodingError:
            return "Failed to decode data. Please try again later."
        case .invalidURL:
            return "Invalid request URL."
        case .unknownError(let error):
            return "Unexpected error: \(error.localizedDescription)"
        }
    }
}
