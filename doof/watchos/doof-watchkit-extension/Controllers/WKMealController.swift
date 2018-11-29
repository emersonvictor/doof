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
        self.clearButtons()
        self.breakfastBtn.setBackgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
    }
    
    @IBAction func eatLunch() {
        self.clearButtons()
        self.lunchBtn.setBackgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
    }
    
    @IBAction func eatDinner() {
        self.clearButtons()
        self.dinnerBtn.setBackgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
    }
    
    @IBAction func eatSnack() {
        self.clearButtons()
        self.snackBtn.setBackgroundColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
    }
    
    @IBAction func confirmMeal() {
        if self.selectedMeal == nil {
            let ok = WKAlertAction(title: "OK", style: .default) {
                self.dismiss()
            }
            self.presentAlert(withTitle: "Refeição não selecionada", message: "Antes de alimentar doof você precisa selecionar uma refeição", preferredStyle: .alert, actions: [ok])
        } else {
            self.presentController(withName: "WKHealthinessController", context: self.selectedMeal)
        }
    }
}
