//
//  AppContext.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-18.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
import UIKit

protocol AppContextType {
    var appCoordinator: AppCoordinatorType? { get set }
    var coordinatorFactory: CoordinatorFactoryType { get }
    var viewControllerFactory: ViewControllerFactoryType { get }
    var weatherAppManager: WeatherAppManagerType { get }
}

final class AppContext: AppContextType {

    var appCoordinator: AppCoordinatorType?
    var viewControllerFactory: ViewControllerFactoryType
    var coordinatorFactory: CoordinatorFactoryType
    var weatherAppManager: WeatherAppManagerType

    init() {
        self.coordinatorFactory = CoordinatorFactory()
        self.viewControllerFactory = ViewControllerFactory()
        self.weatherAppManager = WeatherAppManager()
        self.appCoordinator = coordinatorFactory.makeAppCoordinator(appContext: self,
                                                                    navigationController: UINavigationController())
    }
}
