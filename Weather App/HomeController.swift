//
//  ViewController.swift
//  Weather App
//
//  Created by Amr El-Fiqi on 19/03/2023.
//

import UIKit


class HomeController: UIViewController {
    
    // MARK: - Variables
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
                self?.setupHeader()
                self?.setupSubheader()
            }
        }
    }
    
    private func setupUI() {
        
    }
    
    private func setupHeader() {
        tempLabel.text = viewModel.tempratureString
        nameLabel.text = viewModel.nameString
    }
    
    private func setupSubheader() {
        feelsLikeLabel.text = viewModel.feelsLikeTempString
        minTempLabel.text = viewModel.minTempString
        maxTempLabel.text = viewModel.maxTempString
        pressureLabel.text = viewModel.pressureString
        humidityLabel.text = viewModel.humidityString
    }
    
}

