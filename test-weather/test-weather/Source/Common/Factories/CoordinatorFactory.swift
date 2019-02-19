//
//  CoordinatorFactory.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-18.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
import UIKit

final class CoordinatorFactory: CoordinatorFactoryType {

    func makeAppCoordinator(appContext: AppContextType, navigationController: UINavigationController) -> AppCoordinatorType {
        return AppCoordinator(appContext: appContext, navigationController: navigationController)
    }

    func makeWeatherViewCoordinator(appContext: AppContextType, navigationController: UINavigationController) -> WeatherViewCoordinatorType {
        return WeatherViewCoordinator(appContext: appContext, navigationController: navigationController)
    }
}
