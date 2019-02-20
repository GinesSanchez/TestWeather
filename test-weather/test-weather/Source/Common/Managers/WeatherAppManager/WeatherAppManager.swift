//
//  WeatherAppManager.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

final class WeatherAppManager: WeatherAppManagerType {

    var networkManager: NetworkManagerType

    init(networkManager: NetworkManagerType) {
        self.networkManager = networkManager
    }

    func getTemperature(city: String, key: String, units: String, completionHandler: @escaping (Int?, Error?) -> Void) {

        let url = networkManager.createURLFromParameters(parameters: [Constants.WeatherAPIDetails.cityKey : city,
                                                       Constants.WeatherAPIDetails.apiKey : key,
                                                       Constants.WeatherAPIDetails.unitsKey : units])



        networkManager.getJson(with: url) { (json, error) in
            guard let json = json else {
                completionHandler(nil, error)
                return
            }

            if let mainInfoJson = json["main"] as! [String: Any]? {
                guard let currentTemperature = mainInfoJson["temp"] as! Int? else {
                    //TODO: Current temperature not found
                    completionHandler(nil, nil)
                    return
                }

                completionHandler(currentTemperature, nil)

            } else if let apiErrorCode = json["cod"] as! String? {
                //TODO: Enum with errors

                //API Errors
                switch apiErrorCode {
                case "401":
                    //401 = Invalid API Key
                    break
                case "404":
                    if let apiErrorMessage = json["message"] as! String? {
                        switch apiErrorMessage {
                        case "Internal error":
                            //Internal Error
                            break
                        case "city not found":
                            //city not found
                            break
                        default:
                            //Unknown API error
                            break
                        }
                    }                    
                default:
                    //Unknown API error
                    break
                }
            }
        }
    }

    func getCelsiusTemperature(city: String, key: String, completionHandler: @escaping (Int?, Error?) -> Void) {
        getTemperature(city: city, key: key, units: Constants.WeatherAPIDetails.defaultUnitsValue) { (temperature, error) in
            completionHandler(temperature, error)
        }
    }
}
