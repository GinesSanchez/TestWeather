//
//  FakeAppContextType.swift
//  TestWeather
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
import UIKit

final class FakeAppContextType: AppContextType {

    var appCoordinator: AppCoordinatorType?
    var viewControllerFactory: ViewControllerFactoryType
    var coordinatorFactory: CoordinatorFactoryType
    var weatherAppManager: WeatherAppManagerType
    var networkManager: NetworkManagerType

    init() {
        self.coordinatorFactory = CoordinatorFactory()
        self.viewControllerFactory = ViewControllerFactory()
        self.networkManager = NetworkManager()
        self.weatherAppManager = WeatherAppManager(networkManager: self.networkManager)
        self.appCoordinator = coordinatorFactory.makeAppCoordinator(appContext: self,
                                                                    navigationController: UINavigationController())
    }
}
