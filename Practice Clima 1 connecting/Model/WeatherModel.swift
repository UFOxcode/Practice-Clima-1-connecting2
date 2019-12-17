//
//  WeatherModel.swift
//  Practice Clima 1 connecting
//
//  Created by UFO Xcode on 2019/12/17.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    
    var tempertureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
    
    
    
    
    var conditionName: String {
        switch conditionId {
              case 200...232:
                  return "cloud.bolt"
              case 300...321:
                  return "cloud.drizzle"
              case 500...532:
                  return "cloud.rain"
              case 600...622:
                  return "cloud.snow"
              case 701...781:
                  return "cloud.fog"
              case 800:
                  return "sun.max"
              case 801...804:
                  return "cloud.bolt"
        
              default:
                  return "sun.max"
        }
      }
    
}

