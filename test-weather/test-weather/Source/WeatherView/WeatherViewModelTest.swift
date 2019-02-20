//
//  WeatherViewModelTest.swift
//  TestWeatherTests
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import XCTest
@testable import TestWeather

class WeatherViewModelTest: TestCaseBase {

    var weatherViewModel: WeatherViewModel?

    override func setUp() {
        super.setUp()

        weatherViewModel = WeatherViewModel(delegate: fakeWeatherViewModelDelegate, appContext: fakeAppContext)
    }

    func testInit_whenFreshlyInitialised_shouldNotHaveCalledStateDidChange() {
        XCTAssertFalse(fakeWeatherViewModelDelegate.didStateDidChangeCalled)
    }

    func testUpdate_whenStateChange_shouldHaveCalledStateDidChange() {
        weatherViewModel?.viewModelState = .loading
        DispatchQueue.main.async { [weak self] in
            XCTAssert(self?.fakeWeatherViewModelDelegate.didStateDidChangeCalled ?? false)
        }
    }

    func testUpdate_whenCurrentTemperatureIsNotSet_shouldReturnTemperatureNotAvailableMessage() {
        XCTAssertEqual("Karachi tempenture: Not Available", weatherViewModel?.currentTemperatureMessage)
    }

    func testUpdate_whenCurrentTemperatureIsNotSet_shouldReturnTemperatureMessage() {
        weatherViewModel?.currentTemperature = 22
        XCTAssertEqual("Karachi tempenture: 22 ºC", weatherViewModel?.currentTemperatureMessage)
    }
}
