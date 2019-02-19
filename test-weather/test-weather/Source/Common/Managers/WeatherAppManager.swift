//
//  WeatherAppManager.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

final class WeatherAppManager: WeatherAppManagerType {

    func createURLFromParameters(parameters: [String:Any]) -> URL {
        var components = URLComponents()
        components.scheme = Constants.WeatherAPIDetails.apiScheme
        components.host = Constants.WeatherAPIDetails.apiHost
        components.path = Constants.WeatherAPIDetails.apiPath

        if !parameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }

        return components.url!
    }

    func getTemperature(city: String, key: String, units: String) -> Int {

        let url = createURLFromParameters(parameters: [Constants.WeatherAPIDetails.cityKey : city,
                                                       Constants.WeatherAPIDetails.apiKey : key,
                                                       Constants.WeatherAPIDetails.unitsKey : units])

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                let mainInfoJson = json["main"] as! [String: Any]
                print(mainInfoJson["temp"])
            } catch let error as NSError {
                print(error)
            }
        }

        task.resume()

        return 0
    }

    func getCelsiusTemperature(city: String, key: String) -> Int {
        return getTemperature(city: city, key: key, units: Constants.WeatherAPIDetails.defaultUnitsValue)
    }
}
