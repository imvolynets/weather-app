//
//  APIRequestType.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Foundation

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryParams: [String: String] { get set }
    var queryItems: [URLQueryItem]? { get }
}
