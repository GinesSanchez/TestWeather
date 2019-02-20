//
//  WeatherAppManagerType.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

protocol WeatherAppManagerType {

    var networkManager: NetworkManagerType { get }

    /// Retrives Current Temperature of a city
    ///
    /// - Parameter
    ///     - city: Name of the city.
    ///     - key: Key of Weather API.
    ///     - units: Fahrenheit = imperial. Celsius = metric. Temperature in Kelvin is used by default
    ///     - completionHandler: will be triggred when the request is done. If it is successful, returns the temperature of the city in interger format. Error will be nil if successful. If there is an error, and weather app error type is returned, and dictionary will be nil.
    func getTemperature(city: String, key: String, units: String, completionHandler: @escaping (Int?, WeatherAppError?) -> Void)

    /// Retrives Current Temperature of a city in Celsius
    ///
    /// - Parameter
    ///     - city: Name of the city.
    ///     - key: Key of Weather API.
    ///     - completionHandler: will be triggred when the request is done. If it is successful, returns the temperature of the city in Celsisu in interger format. Error will be nil if successful. If there is an error, and weather app error type is returned, and dictionary will be nil.
    func getCelsiusTemperature(city: String, key: String, completionHandler: @escaping (Int?, WeatherAppError?) -> Void)
}
