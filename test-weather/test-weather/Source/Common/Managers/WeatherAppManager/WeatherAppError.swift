//
//  WeatherAppError.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

public enum WeatherAppError: Error {

    case noInternetConnection
    case currentTemperatureNotFound
    case invalidApiKey
    case internalError
    case cityNotFound
    case unknownApiError
    case unknownError


    /// descriptive representation of error, should be used for debugging
    public var description: String {
        switch self {
        case .noInternetConnection:
            return "There is not internet connection."
        case .currentTemperatureNotFound:
            return "It was not possible to find the current temperature of the city."
        case .invalidApiKey:
            return "Invalid API Key."
        case .internalError:
            return "Internal Error. E.g. wrong url call."
        case .cityNotFound:
            return "City not found in the API data system."
        case .unknownApiError:
            return "Unknown Api Error."
        case .unknownError:
            return "Uknown Error from the request."
        }
    }
}
