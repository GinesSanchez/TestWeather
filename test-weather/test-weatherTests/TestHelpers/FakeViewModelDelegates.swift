//
//  FakeViewModelDelegates.swift
//  TestWeather
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation
@testable import TestWeather

final class FakeWeatherViewModelDelegate: WeatherViewModelDelegate {

    //MARK: - stateDidChange

    var didStateDidChangeCalled = false

    func viewModel(_ viewModel: WeatherViewModel, stateDidChange state: ViewModelState<WeatherViewReadyState>) {
        didStateDidChangeCalled = true
    }
}
