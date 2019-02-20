//
//  AppCoordinator.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-18.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
import UIKit

protocol AppCoordinatorType: Coordinating {
    var navigationController: UINavigationController? { get set }
}

final class AppCoordinator: AppCoordinatorType {
    let appContext: AppContextType
    let coordinatorFactory: CoordinatorFactoryType
    let viewControllerFactory: ViewControllerFactoryType
    var navigationController: UINavigationController?

    var weatherViewCoordinator: WeatherViewCoordinatorType?

    init(appContext: AppContextType, navigationController: UINavigationController) {
        self.appContext = appContext
        self.coordinatorFactory = appContext.coordinatorFactory
        self.viewControllerFactory = appContext.viewControllerFactory
        self.navigationController = navigationController
    }

    func start() {
        weatherViewCoordinator = coordinatorFactory.makeWeatherViewCoordinator(appContext: appContext, navigationController: navigationController!)
        weatherViewCoordinator?.start()
    }

    func stop() {
        weatherViewCoordinator?.stop()
        weatherViewCoordinator = nil
    }
}

