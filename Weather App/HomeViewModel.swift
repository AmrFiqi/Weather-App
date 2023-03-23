//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 23/03/2023.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Variables
    
    var weather: Weather?
    private var main: Weather.Main? {
        return weather?.main
    }
    
    // MARK: - Header Strings
    
//    var tempratureString: String {
//        return "\(String(format: "%.1f", (weather?.temp ?? 0).kelvinToFahrenheit))° F"
//    }
//
    var nameString: String {
        return String(weather?.name ?? "")
    }
    
    var tempratureString: String {
        return kelvinToF(main?.temp)
    }
    
    // MARK: - SubHeader Strings
    
    var feelsLikeTempString: String {
        return kelvinToF(main?.feelsLike)
    }
    
    var minTempString: String {
        return kelvinToF(main?.minTemp)
    }
    
    var maxTempString: String {
        return kelvinToF(main?.maxTemp)
    }
    
    var pressureString: String {
        return valueToString(main?.pressure)
    }
    
    var humidityString: String {
        return valueToString(main?.humidity) + "%"
    }
    
    // MARK: - Class Methods
    
    func fetchWeather(for cityId: Int = 360630, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weather in
            self.weather = weather
            completion()
        }
    }
    
    func kelvinToF (_ temp: Double?) -> String {
        return "\(String(format: "%.1f", (temp ?? 0).kelvinToFahrenheit))° F"
    }
    
    func valueToString(_ value: Double?) -> String {
        return String(format: "%.1f", (value ?? 0))
    }
    
}
