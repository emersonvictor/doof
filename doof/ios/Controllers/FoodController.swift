//
//  FoodController.swift
//  doof
//
//  Created by Emerson Victor on 14/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit
import SpriteKit

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
    let selectionFeedback = UISelectionFeedbackGenerator()
    let notificationFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        self.healthinessSlider.isContinuous = false
        
        // Round corner
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true
    }
    
    // MARK: - Modal options
    @IBAction func confirmAction(_ sender: UIButton) {
        if let meal = self.selectedMeal {
            // Save food stamp
            let foodstamp = FoodstampObject(time: Date(), meal: meal, healthiness: self.selectedHealthiness)
            foodstamp.save()
            
            self.notificationFeedback.notificationOccurred(.success)
            
            let mainController = self.presentingViewController?.children.last as! MainController
            let singletonDoof = UserSingleton.shared.doof!
            singletonDoof.state = .eating
            mainController.doofNode?.animate(withState: singletonDoof.state)
            let foodAnimatedNode = mainController.mainSKView.scene?.childNode(withName: "foodAnimated")
            let foodAnimation = SKAction(named: "foodAnimated")
            foodAnimatedNode?.run(foodAnimation!)
            self.dismiss(animated: true, completion: nil)
            
            
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
        self.notificationFeedback.notificationOccurred(.warning)
    }
    
    // MARK: - Food actions
    @IBAction func chooseMealAction(_ sender: UIButton) {
        // Remove selected state of all buttons
        let buttons = [self.breakfast, self.lunch, self.dinner, self.snack]
        for button in buttons {
            let circularButton = button as! CircleButton
            circularButton.isSelected = false
            circularButton.setSelectedState()
        }
        
        // Set a variable to indicate which meal is selected
        let customButton = sender as! CircleButton
        if customButton == self.breakfast {
            self.selectedMeal = .breakfast
        } else if customButton == self.lunch {
            self.selectedMeal = .lunch
        } else if customButton == self.dinner {
            self.selectedMeal = .dinner
        } else {
            self.selectedMeal = .snack
        }
        
        // Set new state of the button
        customButton.isSelected = true
        customButton.setSelectedState()
        self.selectionFeedback.selectionChanged()
    }
    
    @IBAction func changeHealthiness(_ sender: UISlider) {
        let value = sender.value
        
        let mainController = self.presentingViewController?.children.last as! MainController
        let foodAnimatedNode = mainController.mainSKView.scene?.childNode(withName: "foodAnimated") as! SKSpriteNode
        
        if value <= 0.15 {
            
            sender.setValue(0, animated: true)
            self.selectedHealthiness = .unhealthy
            foodAnimatedNode.texture = SKTexture(imageNamed: "unhealthy")
        } else if value <= 0.45 {
            sender.setValue(0.3, animated: true)
            self.selectedHealthiness = .lessHealthy
            foodAnimatedNode.texture = SKTexture(imageNamed: "lessHealthy")
        } else if value <= 0.75 {
            sender.setValue(0.6, animated: true)
            self.selectedHealthiness = .healthy
            foodAnimatedNode.texture = SKTexture(imageNamed: "healthy")
        } else {
            sender.setValue(0.9, animated: true)
            self.selectedHealthiness = .veryHealthy
            foodAnimatedNode.texture = SKTexture(imageNamed: "veryHealthy")
        }
        self.selectionFeedback.selectionChanged()
    }
}


