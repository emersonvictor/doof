//
//  WKHealthinessController.swift
//  doof
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import WatchKit
import Foundation


class WKHealthinessController: WKInterfaceController {

    // MARK: - Outlets
    @IBOutlet var healthinessLabel: WKInterfaceLabel!
    @IBOutlet var slider: WKInterfaceSlider!
    
    // MARK: - Variables
    var selectedMeal: Meal? = nil
    var selectedHealthiness: Healthiness = .unhealthy
    
    // MARK: - Initializers
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.selectedMeal = context as? Meal
    }
    
    // MARK: - Actions
    @IBAction func changeHealthiness(_ value: Float) {
        switch value {
        case 0:
            self.slider.setValue(1)
        case 1:
            self.healthinessLabel.setText("Unhealthy")
            self.selectedHealthiness = .unhealthy
        case 2:
            self.healthinessLabel.setText("Less healthy")
            self.selectedHealthiness = .lessHealthy
        case 3:
            self.healthinessLabel.setText("Healthy")
            self.selectedHealthiness = .healthy
        case 4:
            self.healthinessLabel.setText("Very healthy")
            self.selectedHealthiness = .veryHealthy
        case 5:
            self.slider.setValue(4)
        default:
            break
        }
    }
    
    @IBAction func feedDoof() {
        print("comeu")
        self.presentController(withName: "MainController", context: nil)
    }
}
