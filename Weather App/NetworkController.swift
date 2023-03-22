//
//  NetworkController.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 19/03/2023.
//

import Foundation

struct NetworkController {
    
    private static var baseUrl = "https://api.openweathermap.org"
    private static var path = "/data/2.5/weather"
    
    enum EndPoint {
        case cityId(path: String, id: Int)
        
        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = NetworkController.baseUrl
            components.path = NetworkController.path
            components.queryItems = queryItems
            
            return components.url
            
        }
        
        var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_,let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryItems.append(URLQueryItem(name: "appid", value: "1234"))
            
            return queryItems
        }
    }
}
