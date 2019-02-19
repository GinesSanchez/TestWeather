//
//  WeatherViewModel.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

enum WeatherViewReadyState {
    case temperatureReady
}

enum WeatherViewModelError: Error {
    case notReachable
}

protocol WeatherViewModelDelegate: class {
    func viewModel(_ viewModel: WeatherViewModel, stateDidChange state: ViewModelState<WeatherViewReadyState>)
}

final class WeatherViewModel {

    private weak var delegate: WeatherViewModelDelegate?

    var viewModelState: ViewModelState<WeatherViewReadyState> = .ready(.temperatureReady) {
        didSet {
            updateViewState(viewModelState)
        }
    }

    private func updateViewState(_ state: ViewModelState<WeatherViewReadyState>) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.viewModel(strongSelf, stateDidChange: state)
        }
    }

    init(delegate: WeatherViewModelDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Actions
extension WeatherViewModel {

    func checkReachability(completion: ((Bool) -> Void)?) {
        //TODO:
    }

    func getTemperature() {

        viewModelState = .loading

        //TODO:
    }
}