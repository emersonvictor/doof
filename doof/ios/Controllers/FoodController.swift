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
    
    // MARK: - Variables
    var selectedMeal:Meal?
    var selectedHealthiness:Healthiness = .unhealthy
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        self.healthinessSlider.isContinuous = false
    }
    
    // MARK: - Modal options
    @IBAction func confirmAction(_ sender: UIButton) {
        if let meal = self.selectedMeal {
            let foodstamp = Foodstamp(time: Date(), meal: meal, healthiness: self.selectedHealthiness)
            foodstamp.save()
            self.presentingViewController?.dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Refeição não selecionada", message: "Antes de alimentar doof você precisa selecionar uma refeição", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.selectedMeal = nil
        self.selectedHealthiness = .unhealthy
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - Food actions
    @IBAction func chooseMealAction(_ sender: UIButton) {
        // Remove selected state of all buttons
        self.breakfast.isSelected = false
        self.lunch.isSelected = false
        self.dinner.isSelected = false
        self.snack.isSelected = false
        
        // Set a variable to indicate which meal is selected
        if sender == self.breakfast {
            self.selectedMeal = .breakfast
        } else if sender == self.lunch {
            self.selectedMeal = .lunch
        } else if sender == self.dinner {
            self.selectedMeal = .dinner
        } else {
            self.selectedMeal = .snack
        }
        
        // Set new state of the button
        sender.isSelected = true
    }
    
    @IBAction func changeHealthiness(_ sender: UISlider) {
        let value = sender.value
        
        if value <= 0.15 {
            sender.setValue(0, animated: true)
            self.selectedHealthiness = .unhealthy
        } else if value <= 0.45 {
            sender.setValue(0.3, animated: true)
            self.selectedHealthiness = .lessHealthy
        } else if value <= 0.75 {
            sender.setValue(0.6, animated: true)
            self.selectedHealthiness = .healthy
        } else {
            sender.setValue(0.9, animated: true)
            self.selectedHealthiness = .veryHealthy
        }
    }
}
