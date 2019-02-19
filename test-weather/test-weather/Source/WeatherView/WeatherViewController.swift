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

    //Private Properties
    private var loginViewModel: WeatherViewModel!    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
    }
}
