//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 23/03/2023.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Variables
    
    var weatherS: WeatherStruct?
    private var main: WeatherStruct.Main? {
        return weatherS?.main
    }
    
    // MARK: - Header Strings
    
//    var tempratureString: String {
//        return "\(String(format: "%.1f", (weather?.temp ?? 0).kelvinToFahrenheit))° F"
//    }
//
    var nameString: String {
        return String(weatherS?.name ?? "")
    }
    var descriptionString: String {
        return String(weatherS?.weather.first?.weatherDescription ?? "")
    }
    var tempratureString: String {
        return kelvinToC(main?.temp)
    }
    
    var minTempString: String {
        return kelvinToC(main?.minTemp)
    }
    
    var maxTempString: String {
        return kelvinToC(main?.maxTemp)
    }
    
    // MARK: - SubHeader Strings
    
    var feelsLikeTempString: String {
        return kelvinToC(main?.feelsLike)
    }
    
    var pressureString: String {
        return valueToString(main?.pressure)
    }
    
    var humidityString: String {
        return valueToString(main?.humidity) + "%"
    }
    
    // MARK: - Class Methods
    
    func fetchWeather(for cityId: Int = 2172797, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weatherS in
            self.weatherS = weatherS
            completion()
        }
    }
    
    func kelvinToC (_ temp: Double?) -> String {
        return "\(String(format: "%.1f", (temp ?? 0).kelvinToCelsius))°"
    }
    
    func valueToString(_ value: Double?) -> String {
        return String(format: "%.1f", (value ?? 0))
    }
    
}
