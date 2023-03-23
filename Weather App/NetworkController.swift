//
//  NetworkController.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 19/03/2023.
//

import Foundation

struct NetworkController {
    
    private static var baseUrl = "api.openweathermap.org"
    private static var appapi = ""
    enum EndPoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)
        
        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
            
        }
        
        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
                
            }
        }
        
        var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_,let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryItems.append(URLQueryItem(name: "appid", value: appapi))
            
            return queryItems
        }
    }
    
    static func fetchWeather(for cityId: Int, _ completion: @escaping ((Weather) -> Void)) {
      
        if let url = EndPoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error Occured: \(error)")
                }
                
                if let data = data {
                    do{
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather)
                    }
                    catch {
                        print("Catch Error \(error)")
                    }
                    
                }
            }.resume()
        }
        
    }
}
