//
//  Double.Conversion.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 23/03/2023.
//

import Foundation

extension Double {
    var kelvinToFahrenheit: Double {
        return (9.0 / 5) * (self - 273) + 32
    }
}
