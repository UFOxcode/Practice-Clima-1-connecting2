//
//  WeatherManager.swift
//  Practice Clima 1 connecting
//
//  Created by UFO Xcode on 2019/12/17.
//  Copyright © 2019 UFO Xcode. All rights reserved.
//

import Foundation

// unit 143, 把資料傳回給 Controller 用 protocol
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8a47a4ca2f1e08faec9a408732d27747&units=metric"
    
  
    // unit 143, 把資料傳回給 Controller 用 protocol
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=Pingtung"
        performRequest(urlString: urlString)
 
}
    func performRequest (urlString: String){
         //1. Create URL
         if let url = URL(string: urlString){

             //2. Create a URLSession
             let session = URLSession(configuration: .default)
             
             //3. Give the session a task
             let task = session.dataTask(with: url) { (data, response, error) in
                 if error != nil {
                         print(error!)
                         return
                     }
                     
                     if let safaData = data {
                         if let weather =  self.parseJSON(weatherData: safaData) {
                             self.delegate?.didUpdateWeather(weather: weather)
                         }
                         
                     }
             }
          //4. Start the Task
             task.resume()
         }
     }
    
     func parseJSON(weatherData: Data) -> WeatherModel? {
         let decoder = JSONDecoder()
         do {
             let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
             
             let id = decodedData.weather[0].id
             let temp = decodedData.main.temp
             let name = decodedData.name
            
            // 隨時可以加上 在瀏覽器 json view awesome 裡 copy path， 在weather Data的 struct  加上 相同的 path 即可
            let max = decodedData.main.temp_max
            print(max)
            
            let mix = decodedData.main.temp_min
            print(mix)
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
             
            
            print(weather.tempertureString)
             print(name)
             
             print(weather.conditionName)
             return weather
         } catch {
             print(error)
             return nil
         }
         
     }




}
