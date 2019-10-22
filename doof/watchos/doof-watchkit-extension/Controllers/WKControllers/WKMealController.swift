//
//  WKMealController.swift
//  doof
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import WatchKit
import Foundation


class WKMealController: WKInterfaceController {
    
    // MARK: - Outlets
    @IBOutlet var breakfastBtn: WKInterfaceButton!
    @IBOutlet var lunchBtn: WKInterfaceButton!
    @IBOutlet var dinnerBtn: WKInterfaceButton!
    @IBOutlet var snackBtn: WKInterfaceButton!
    
    // MARK: - Variables
    let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    var selectedMeal:Meal? = nil
    
    // MARK: - Initializers
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    // MARK: - Clean buttons
    func clearButtons() {
        self.breakfastBtn.setBackgroundColor(UIColor.clear)
        self.lunchBtn.setBackgroundColor(UIColor.clear)
        self.dinnerBtn.setBackgroundColor(UIColor.clear)
        self.snackBtn.setBackgroundColor(UIColor.clear)
    }
    
    // MARK: - Actions
    @IBAction func eatBreakfast() {
        self.selectedMeal = .breakfast
        self.clearButtons()
        self.breakfastBtn.setBackgroundColor(self.backgroundColor)
    }
    
    @IBAction func eatLunch() {
        self.selectedMeal = .lunch
        self.clearButtons()
        self.lunchBtn.setBackgroundColor(self.backgroundColor)
    }
    
    @IBAction func eatDinner() {
        self.selectedMeal = .dinner
        self.clearButtons()
        self.dinnerBtn.setBackgroundColor(self.backgroundColor)
    }
    
    @IBAction func eatSnack() {
        self.selectedMeal = .dinner
        self.clearButtons()
        self.snackBtn.setBackgroundColor(self.backgroundColor)
    }
    
    @IBAction func confirmMeal() {
        if self.selectedMeal == nil {
            let ok = WKAlertAction(title: "OK", style: .default) {
                self.dismiss()
            }
            self.presentAlert(withTitle: "Choose a meal", message: "Ops, it looks like you didn't choose a meal", preferredStyle: .alert, actions: [ok])
        } else {
            self.presentController(withName: "HealthinessController", context: nil)
            let singletonDoof = UserSingleton.shared.doof!
            singletonDoof.state = .eating
        }
    }
}
