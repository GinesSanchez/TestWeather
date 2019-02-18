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
}

final class AppContext: AppContextType {

    var appCoordinator: AppCoordinatorType?
    var viewControllerFactory: ViewControllerFactoryType
    var coordinatorFactory: CoordinatorFactoryType

    init() {
        self.coordinatorFactory = CoordinatorFactory()
        self.viewControllerFactory = ViewControllerFactory()
        self.appCoordinator = coordinatorFactory.makeAppCoordinator(appContext: self,
                                                                    navigationController: UINavigationController())
    }
}
