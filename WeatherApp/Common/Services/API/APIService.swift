//
//  APIService.swift
//  WeatherApp
//
//  Created by Vladyslav Volynets on 23.02.2025.
//

import Alamofire
import Foundation

protocol APIServiceType {
    func response<Request: APIRequestType>(from request: Request) async throws -> Request.Response
}

final class APIService: APIServiceType {
    private let baseURL: URL
    
    init(baseURL: URL = URL(string: Constants.API.BASE_URL)!) {
        self.baseURL = baseURL
    }
    
    func response<Request: APIRequestType>(from request: Request) async throws -> Request.Response {
        let pathURL = baseURL.appendingPathComponent(request.path)
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        
        guard let url = urlComponents.url else {
            throw APIServiceError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let data = try await AF.request(urlRequest)
                .validate()
                .serializingData()
                .value

            let decoder = JSONDecoder()
            return try decoder.decode(Request.Response.self, from: data)
            
        } catch let afError as AFError {
            if afError.isSessionTaskError {
                throw APIServiceError.noInternetConnection
            } else {
                throw APIServiceError.responseError
            }
        } catch let decodingError as DecodingError {
            throw APIServiceError.decodingError
        } catch {
            throw APIServiceError.unknownError(error)
        }
    }
}
