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
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpbackground()
        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupHeader()
                self?.setupSubheader()
            }
        }
    }
    
    func setUpbackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Weather_Background.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setupHeader() {
        tempLabel.text = viewModel.tempratureString
        nameLabel.text = viewModel.nameString
        minTempLabel.text = viewModel.minTempString
        maxTempLabel.text = viewModel.maxTempString
        descriptionLabel.text = viewModel.descriptionString.capitalized
    }
    
    private func setupSubheader() {
        feelsLikeLabel.text = viewModel.feelsLikeTempString
        pressureLabel.text = viewModel.pressureString
        humidityLabel.text = viewModel.humidityString
    }
    
}

