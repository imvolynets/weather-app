//
//  ForecastRequest.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

struct ForecastRequest: APIRequestType {
    typealias Response = ForecastResponse
    
    var queryParams: [String : String]
    
    init(_ params: [String: String]) {
        queryParams = params
    }
    
    var path: String { return "/data/2.5/forecast" }
    var queryItems: [URLQueryItem]? {
        return queryParams.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }
}
