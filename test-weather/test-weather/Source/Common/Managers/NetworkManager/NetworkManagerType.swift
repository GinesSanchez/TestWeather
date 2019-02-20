//
//  NetworkManagerType.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

protocol NetworkManagerType {

    /// Retrives Weather app URL
    ///
    /// - Parameter parameters: dictionary with parameters [key: value]
    /// - Returns: URL for weather app
    func createURLFromParameters(parameters: [String: Any]) -> URL

    /// Get json from URL
    ///
    /// - Parameter
    ///     - url: url for the get request.
    ///     - completionHandler: will be triggred when the request is done. If it is successfull, the json in a dictionary format is returned. Error will be nil if successful. If there is an error, and error is returned, and dictionary will be nil.
    func getJson(with url: URL, completionHandler: @escaping ([String: Any]?, Error?) -> Void)
}
