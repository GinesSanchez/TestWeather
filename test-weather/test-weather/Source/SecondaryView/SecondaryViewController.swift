//
//  SecondaryViewController.swift
//  TestWeather
//
//  Created by Ginés Sánchez on 2019-02-20.
//  Copyright © 2019 Ginés Sánchez. All rights reserved.
//

import UIKit

protocol SecondaryViewControllerDelegate: class {
    func navigateBack(viewController: SecondaryViewController)
}

final class SecondaryViewController: UIViewController {

    //Public Properties
    weak var delegate: SecondaryViewControllerDelegate?

    //IBOutlets
    @IBOutlet weak var blueCircleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

// MARK: - Set Up Methods
private extension SecondaryViewController {

    func setUp() {
        setUpButtons()
    }

    func setUpButtons() {
        blueCircleButton.setBackgroundImage(UIImage(named: "BlueCircleImage")!, for: .normal)
        blueCircleButton.setTitle("Go Back!", for: .normal)   //TODO: Localize
    }
}

//MARK: - IBActions
extension SecondaryViewController {

    @IBAction func blueCircleButtonTapped(_ sender: Any) {
        delegate?.navigateBack(viewController: self)
    }
}
