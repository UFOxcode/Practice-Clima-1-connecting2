//
//  ViewController.swift
//  Practice Clima 1 connecting
//
//  Created by UFO Xcode on 2019/12/17.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    var weatherManager = WeatherManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.fetchWeather(cityName: "Pingtung")
        
        
        
        
    }

    @IBAction func button1(_ sender: UIButton) {
    }
    
}

