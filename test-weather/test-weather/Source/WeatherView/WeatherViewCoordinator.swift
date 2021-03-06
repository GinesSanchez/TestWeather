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

    var weatherViewController: WeatherViewController?
    var secondaryViewController: SecondaryViewController?

    init(appContext: AppContextType, navigationController: UINavigationController) {
        self.appContext = appContext
        self.coordinatorFactory = appContext.coordinatorFactory
        self.viewControllerFactory = appContext.viewControllerFactory
        self.navigationController = navigationController
    }

    func start() {
        weatherViewController = viewControllerFactory.makeWeatherView(delegate: self, appContext: appContext)
        navigationController?.pushViewController(weatherViewController!, animated: true)
    }

    func stop() {
        navigationController?.popViewController(animated: false)
        weatherViewController = nil        
    }
}

extension WeatherViewCoordinator: WeatherViewControllerDelegate {

    func navigateToSecondaryView(viewController: UIViewController) {
        secondaryViewController = viewControllerFactory.makeSecondaryView(delegate: self)
        navigationController?.pushViewController(secondaryViewController!, animated: true)
    }
}

extension WeatherViewCoordinator: SecondaryViewControllerDelegate {

    func navigateBack(viewController: SecondaryViewController) {
        navigationController?.popViewController(animated: true)
        secondaryViewController = nil
    }
}

