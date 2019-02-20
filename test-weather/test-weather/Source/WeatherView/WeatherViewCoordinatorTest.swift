//
//  WeatherViewCoordinatorTest.swift
//  test-weatherTests
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import XCTest
@testable import TestWeather

class WeatherViewCoordinatorTest: TestCaseBase {

    var weatherViewCoordinator: WeatherViewCoordinator?

    override func setUp() {
        super.setUp()

        weatherViewCoordinator = WeatherViewCoordinator(appContext: fakeAppContext, navigationController: fakeNavigationController)
    }

    func testInit_whenFreshlyInitialised_shouldNotHaveViewController() {
        let viewController = weatherViewCoordinator?.weatherViewController

        XCTAssertNil(viewController, "we should lazily load the view controller on start")
    }

    func testStart_whenInvoked_shouldReplaceViewController() {
        weatherViewCoordinator?.start()

        if let numberOfViewControllersOnNavigationController = fakeNavigationController?.viewControllers.count {
            XCTAssert(numberOfViewControllersOnNavigationController == 1, "Number of controllers should be 1")
        } else {
            XCTAssert(false, "view controllers property has not been set on navigation controller")
        }
    }

    func testStart_whenInvoked_shouldReplaceViewControllerOnNavigationControllerWithWeatherViewController() {
        weatherViewCoordinator?.start()

        let firstViewController = fakeNavigationController?.viewControllers[0]
        XCTAssert(firstViewController is WeatherViewController)
    }

    func testStop_whenInvoked_shouldNilOutViewController() {
        weatherViewCoordinator?.start() // should create vc
        weatherViewCoordinator?.stop() //should deallocate the vc

        XCTAssert(weatherViewCoordinator?.weatherViewController == nil)
    }
}
