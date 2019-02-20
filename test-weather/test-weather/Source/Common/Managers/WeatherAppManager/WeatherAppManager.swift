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

    func getTemperature(city: String, key: String, units: String, completionHandler: @escaping (Int?, WeatherAppError?) -> Void) {

        let url = networkManager.createURLFromParameters(parameters: [Constants.WeatherAPIDetails.cityKey : city,
                                                       Constants.WeatherAPIDetails.apiKey : key,
                                                       Constants.WeatherAPIDetails.unitsKey : units])

        networkManager.getJson(with: url) { (json, error) in
            guard let json = json else {
                guard let error = error else {
                    completionHandler(nil, .unknownError)
                    return
                }
                let code = (error as NSError).code
                let weatherAppError: WeatherAppError = (code == -1009) ? .noInternetConnection : .unknownError
                completionHandler(nil, weatherAppError)
                return
            }

            if let mainInfoJson = json["main"] as! [String: Any]? {
                guard let currentTemperature = mainInfoJson["temp"] as! Int? else {
                    completionHandler(nil, .currentTemperatureNotFound)
                    return
                }

                completionHandler(currentTemperature, nil)

            } else {

                //For some error the 'cod' is a int and for others is a string.
                var errorCode: Int = 0
                if let apiErrorCode = json["cod"] as? String {
                    errorCode = Int(apiErrorCode)!
                } else if let apiErrorCode = json["cod"] as? Int {
                    errorCode = apiErrorCode
                }

                //API Errors
                switch errorCode {
                case 401:
                    completionHandler(nil, .invalidApiKey)
                    break
                case 404:
                    if let apiErrorMessage = json["message"] as! String? {
                        switch apiErrorMessage {
                        case "Internal error":
                            completionHandler(nil, .internalError)
                            break
                        case "city not found":
                            completionHandler(nil, .cityNotFound)
                            break
                        default:
                            completionHandler(nil, .unknownApiError)
                            break
                        }
                    }                    
                default:                    
                    completionHandler(nil, .unknownApiError)
                    break
                }
            }
        }
    }

    func getCelsiusTemperature(city: String, key: String, completionHandler: @escaping (Int?, WeatherAppError?) -> Void) {
        getTemperature(city: city, key: key, units: Constants.WeatherAPIDetails.defaultUnitsValue) { (temperature, error) in
            completionHandler(temperature, error)
        }
    }
}
