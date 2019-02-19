//
//  Constants.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

enum Constants {

    enum WeatherAPIDetails {
        static let apiScheme: String = "https"
        static let apiHost: String = "api.openweathermap.org"
        static let apiPath: String = "/data/2.5/weather/"
        static let apiKey: String = "APPID"
        static let cityKey: String = "q"
        static let unitsKey: String = "units"
        static let apiKeyValue: String = "13707c65904c020b88624e021a64524d"
        static let defaultCityValue: String = "Karachi"
        static let defaultUnitsValue: String = "metric"
    }
}
