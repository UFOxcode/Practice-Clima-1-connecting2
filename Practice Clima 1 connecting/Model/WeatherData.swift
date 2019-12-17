//
//  WeatherData.swift
//  Practice Clima 1 connecting
//
//  Created by UFO Xcode on 2019/12/17.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
}

struct Weather: Codable {
    let description : String
    let id : Int
}

