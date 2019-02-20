//
//  CoordinatorTestCaseBase.swift
//  TestWeatherTests
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import XCTest
@testable import TestWeather

class CoordinatorTestCaseBase: XCTestCase {

    //TODO: Add properties
    var fakeAppContext: FakeAppContextType!
    var fakeNavigationController: UINavigationController!

    override func setUp() {
        //TODO:
        fakeNavigationController = UINavigationController()
        fakeAppContext = FakeAppContextType()
    }
}
