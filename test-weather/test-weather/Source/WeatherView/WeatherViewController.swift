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

    //IBOutlets
    @IBOutlet weak var redCircleImageView: UIImageView!
    @IBOutlet weak var greenCircleImageView: UIImageView!
    @IBOutlet weak var blueCircleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

private extension WeatherViewController {

    func setUp() {
        setUpNavigationBar()
        setUpImageViews()
    }

    func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }

    func setUpImageViews() {        
        redCircleImageView.image = UIImage(named: "RedCircleImage")!
        greenCircleImageView.image = UIImage(named: "GreenCircleImage")!
        blueCircleImageView.image = UIImage(named: "BlueCircleImage")!
    }
}
