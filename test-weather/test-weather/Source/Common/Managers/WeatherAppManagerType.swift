//
//  WeatherAppManagerType.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

protocol WeatherAppManagerType {

    /// Retrives Weather app URL
    ///
    /// - Parameter parameters: dictionary with parameters [key: value]
    /// - Returns: URL for weather app
    func createURLFromParameters(parameters: [String:Any]) -> URL

    /// Retrives Current Temperature of a city
    ///
    /// - Parameter
    ///     - city: Name of the city.
    ///     - key: Key of Weather API.
    ///     - units: Fahrenheit = imperial. Celsius = metric. Temperature in Kelvin is used by default
    /// - Returns: Current temperature of the city in integer format
    func getTemperature(city: String, key: String, units: String) -> Int

    /// Retrives Current Temperature of a city in Celsius
    ///
    /// - Parameter
    ///     - city: Name of the city.
    ///     - key: Key of Weather API.
    /// - Returns: Current temperature of the city in Celsius in integer format
    func getCelsiusTemperature(city: String, key: String) -> Int
}
