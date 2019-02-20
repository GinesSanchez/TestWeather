//
//  WeatherViewController.swift
//  test-weather
//
//  Created by Ginés Sánchez on 2019-02-19.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import UIKit

protocol WeatherViewControllerDelegate: class { }

final class WeatherViewController: UIViewController {

    //Public Properties
    weak var delegate: WeatherViewControllerDelegate?
    var appContext: AppContextType!

    //Private Properties
    private var weatherViewModel: WeatherViewModel!

    //IBOutlets
    @IBOutlet weak var redCircleImageView: UIImageView!
    @IBOutlet weak var greenCircleImageView: UIImageView!
    @IBOutlet weak var blueCircleImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

private extension WeatherViewController {

    func setUp() {
        setUpViewModel()
        setUpNavigationBar()
        setUpImageViews()
        setUpLabels()
    }

    func setUpViewModel() {
        weatherViewModel = WeatherViewModel(delegate: self, appContext: appContext)
        weatherViewModel.getCurrentTemperature()
    }

    func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }

    func setUpImageViews() {        
        redCircleImageView.image = UIImage(named: "RedCircleImage")!
        greenCircleImageView.image = UIImage(named: "GreenCircleImage")!
        blueCircleImageView.image = UIImage(named: "BlueCircleImage")!
    }

    func setUpLabels() {
        titleLabel.text = weatherViewModel.title
    }
}

extension WeatherViewController: WeatherViewModelDelegate {

    func viewModel(_ viewModel: WeatherViewModel, stateDidChange state: ViewModelState<WeatherViewReadyState>) {
        switch state {
        case .empty:
            break
        case .loading:
            handleLoadingState(viewModel: viewModel)
        case .ready(let readyState):
            handleReadyState(viewModel: viewModel, state: readyState)
        case .failure(let error):
            handleError(error: error)
        }
    }
}

// MARK: - Handle View Model State
extension WeatherViewController {

    /// Handle changes in the viewmodels ready state
    private func handleReadyState(viewModel: WeatherViewModel, state: WeatherViewReadyState) {
        updateView(currentTemperature: viewModel.currentTemperatureMessage)
    }

    /// Handle changes in the viewmodels failure state
    private func handleError(error: Error) {
        guard let weatherAppError = error as? WeatherAppError else {
            return
        }

        switch weatherAppError {
        case .noInternetConnection:
            let errorMessage = "There is no internet connection. Please, check your internet settings on your device"       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .currentTemperatureNotFound:
            let errorMessage = "It was not possible to find the current temperature for the city. Please, try again later."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .invalidApiKey:
            let errorMessage = "The app is not allow to get the current temperature of the city. Please, contact support."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .internalError:
            let errorMessage = "An unknown error happens. Please, contact support."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .cityNotFound:
            let errorMessage = "We couldn't find the city. Please, try with another one."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .unknownApiError:
            let errorMessage = "An unknown error happens. Please, contact support."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        case .unknownError:
            let errorMessage = "An unknown error happens. Please, contact support."       //TODO: Localize
            updateView(errorMessage: errorMessage)
        }
    }

    private func handleLoadingState(viewModel: WeatherViewModel) {
        updateView(currentTemperature: viewModel.loadingMessage)
    }
}

//MARK: - Update Methods
private extension WeatherViewController {

    func updateView(currentTemperature: String? = nil, errorMessage: String? = nil) {
        updateLabels(currentTemperature: currentTemperature, errorMessage: errorMessage)
    }

    func updateLabels(currentTemperature: String? = nil, errorMessage: String? = nil) {
        if let currentTemperature = currentTemperature {
            messageLabel.text = currentTemperature
        } else {
            messageLabel.text = errorMessage
        }
    }
}
