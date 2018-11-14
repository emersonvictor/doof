//
//  FoodController.swift
//  doof
//
//  Created by Emerson Victor on 14/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class FoodController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var confirm: UIButton!
    @IBOutlet weak var cancel: UIButton!
    // Food option
    @IBOutlet weak var breakfast: UIButton!
    @IBOutlet weak var lunch: UIButton!
    @IBOutlet weak var dinner: UIButton!
    @IBOutlet weak var snack: UIButton!
    // Slider
    @IBOutlet weak var healthinessSlider: UISlider!
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Modal options
    @IBAction func confirmAction(_ sender: UIButton) {
        print("I confirmed my food")
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        print("I cancel the food")
    }
    
    // MARK: - Food actions
    @IBAction func chooseMealAction(_ sender: UIButton) {
        print("I choose my meal")
    }
    
    @IBAction func changeHealthiness(_ sender: UISlider) {
        print("I changed my healthiness")
    }
}
