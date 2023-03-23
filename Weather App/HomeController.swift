//
//  ViewController.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 19/03/2023.
//

import UIKit

class HomeViewModel {
    private var main: Weather.Main? {
        return weather?.main
    }
    
    var weather: Weather?
    var tempratureString: String {
        return "\(String(main?.temp ?? 0))° F"
    }
    var nameString: String {
        return String(weather?.name ?? "")
    }
    func fetchWeather(for cityId: Int = 2172797, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weather in
            self.weather = weather
            completion()
        }
    }
}

class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
        
    }
    
    private func setupUI() {
        tempLabel.text = viewModel.tempratureString
        nameLabel.text = viewModel.nameString
    }


}

