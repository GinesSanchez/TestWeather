//
//  WeatherViewCoordinator.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherViewCoordinatorType: Coordinating {
    var navigationController: UINavigationController? { get set }
}

final class WeatherViewCoordinator: WeatherViewCoordinatorType {
    let appContext: AppContextType
    let coordinatorFactory: CoordinatorFactoryType
    let viewControllerFactory: ViewControllerFactoryType
    var navigationController: UINavigationController?

    init(appContext: AppContextType, navigationController: UINavigationController) {
        self.appContext = appContext
        self.coordinatorFactory = appContext.coordinatorFactory
        self.viewControllerFactory = appContext.viewControllerFactory
        self.navigationController = navigationController
    }

    func start() {
        //TODO: Create View Controller coordinator.
        //TODO: start view controller coordinator.        
    }

    func stop() {
        //TODO: stop view controller coordinator.
        //TODO: set to nil view controller coordinator.
    }
}

