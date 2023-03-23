//
//  Weather.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 19/03/2023.
//

import Foundation

struct Weather: Decodable {
    var name: String
    var main: Main
    
    struct Main: Decodable {
        var temp: Double
        var feelsLike: Double
        var minTemp: Double
        var maxTemp: Double
        var pressure: Double
        var humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case temp, pressure, humidity
        }
    }
}

extension Weather {
    var temp: Double {
        return main.temp
    }
    
    var feelsLike: Double {
        return main.feelsLike
    }
    
    var minTemp: Double {
        return main.minTemp
    }
    
    var maxTemp: Double {
        return main.maxTemp
    }
    
    var pressure: Double {
        return main.pressure
    }
    
    var humidity: Double {
        return main.humidity
    }
}
