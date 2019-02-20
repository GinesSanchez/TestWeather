//
//  CoordinatorTestCaseBase.swift
//  TestWeatherTests
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import XCTest
@testable import TestWeather

class TestCaseBase: XCTestCase {
    
    var fakeAppContext: FakeAppContextType!
    var fakeNavigationController: UINavigationController!
    var fakeWeatherViewModelDelegate: FakeWeatherViewModelDelegate!

    override func setUp() {
        fakeNavigationController = UINavigationController()
        fakeAppContext = FakeAppContextType()
        fakeWeatherViewModelDelegate = FakeWeatherViewModelDelegate()
    }
}
