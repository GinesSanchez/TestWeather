//
//  WeatherViewModel.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import Foundation

enum WeatherViewReadyState {
    case currentTemperatureReady
}

enum WeatherViewModelError: Error {
    case notReachable
}

protocol WeatherViewModelDelegate: class {
    func viewModel(_ viewModel: WeatherViewModel, stateDidChange state: ViewModelState<WeatherViewReadyState>)
}

final class WeatherViewModel {

    private weak var delegate: WeatherViewModelDelegate?
    private var appContext: AppContextType
    var currentTemperature: Int?

    var viewModelState: ViewModelState<WeatherViewReadyState> = .ready(.currentTemperatureReady) {
        didSet {
            updateViewState(viewModelState)
        }
    }

    init(delegate: WeatherViewModelDelegate, appContext: AppContextType) {
        self.delegate = delegate
        self.appContext = appContext
    }
}

extension WeatherViewModel {

    func getCurrentTemperature() {

        viewModelState = .loading

        appContext.weatherAppManager.getCelsiusTemperature(city: Constants.WeatherAPIDetails.defaultCityValue, key: Constants.WeatherAPIDetails.apiKeyValue) { [weak self] (temperature, error) in
            guard let error = error else {
                guard let temperature = temperature else {
                    self?.viewModelState = .failure(WeatherAppError.unknownApiError)
                    return
                }

                self?.currentTemperature = temperature
                self?.viewModelState = .ready(.currentTemperatureReady)
                return
            }

            self?.viewModelState = .failure(error)
        }
    }
}

private extension WeatherViewModel {

    func updateViewState(_ state: ViewModelState<WeatherViewReadyState>) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.viewModel(strongSelf, stateDidChange: state)
        }
    }
}

// MARK: - Computed properties
extension WeatherViewModel {

    var title: String {
        return "Weather App"        //TODO: Localize
    }

    var loadingMessage: String {
        return "Getting Temperature..."     //TODO: Localize
    }

    var currentTemperatureMessage: String {
        guard let temperature = currentTemperature else {
            return "Karachi tempenture: Not Available"     //TODO: Localize
        }
        return "Karachi tempenture: \(temperature) ºC"     //TODO: Localize
    }

    var redCircleButtonTitle: String {
        return "Tap Me!"        //TODO: Localize
    }
}
