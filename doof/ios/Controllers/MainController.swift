//
//  ViewController.swift
//  mc4
//
//  Created by Emerson Victor on 01/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import SpriteKit
import UIKit

class MainController: UIViewController {
    
    // MARK: Vars
    var foodTimer = Timer()
    var waterTimer = Timer()
    var happinessTimer = Timer()
    var energyTimer = Timer()
    var isSleeping = false
    var userSelectedSleepingTime = 8.0
    // Haptic Feedback
    let selectionFeedback = UISelectionFeedbackGenerator()
    // Slide transition
    lazy var slideTransitioningDelegate = SlidePresentationManager()
    // SpriteKit
    var scene:GuiozaScene?
    
    
    // MARK: Outlets
    @IBOutlet weak var mainSKView: SKView!
    // Progress bars
    @IBOutlet weak var foodProgressView: UIProgressView!
    @IBOutlet weak var waterProgressView: UIProgressView!
    @IBOutlet weak var happinessProgressView: UIProgressView!
    @IBOutlet weak var energyProgressView: UIProgressView!
    // Buttons
    @IBOutlet weak var mainButton: CircleButton!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!
   
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Food Progress
        self.foodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.foodUpdate), userInfo: nil, repeats: true)
        self.waterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.waterUpdate), userInfo: nil, repeats: true)
        self.energyTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.energyUpdate), userInfo: nil, repeats: true)
        self.happinessTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.happinessUpdate), userInfo: nil, repeats: true)
        
        // Custom Progress Bars
        customProgessBars(progressBar: foodProgressView)
        customProgessBars(progressBar: waterProgressView)
        customProgessBars(progressBar: energyProgressView)
        customProgessBars(progressBar: happinessProgressView)
        
        // SpriteKit
//        let scene = SKScene(fileNamed: "MainScene.sks")
//        scene?.scaleMode = .aspectFill
//        self.mainSKView.presentScene(scene)
        
        
        // Hide interaction buttons
        let x: CGFloat = 60
        let y: CGFloat = 50
        self.waterButton.transform = CGAffineTransform(translationX: x, y: y)
        self.foodButton.transform = CGAffineTransform(translationX: 0, y: 60)
        self.sleepButton.transform = CGAffineTransform(translationX: -x, y: y)
        
        
        //########################################################################
        // MARK: Teste!!!
        //SpriteKit
        
        self.scene = GuiozaScene(size: CGSize(width: self.mainSKView.frame.size.width, height: self.mainSKView.frame.size.height))
        if let scene = self.scene {
            scene.jumpGuioza()
            self.mainSKView.presentScene(scene)
        }
        
    }
    
    //########################################################################
    
    
    
    // MARK: Main Button Interaction
    @IBAction func mainAction(_ sender: CircleButton) {
        sender.isSelected = !sender.isSelected
        sender.setSelectedState()
        self.willHideInteractionButtons(!sender.isSelected)
        // TODO: - Add haptic feedback
        self.selectionFeedback.selectionChanged()
    }
    
    func willHideInteractionButtons(_ hide: Bool) {
        if hide {
            UIView.animate(withDuration: 0.2) {
                let x: CGFloat = 60
                let y: CGFloat = 50
                self.waterButton.transform = CGAffineTransform(translationX: x, y: y)
                self.foodButton.transform = CGAffineTransform(translationX: 0, y: 60)
                self.sleepButton.transform = CGAffineTransform(translationX: -x, y: y)
                
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.waterButton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.foodButton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.sleepButton.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
    
    
    // MARK: - Progress Bar customization
    func customProgessBars(progressBar: UIProgressView) {
        // Deixar redondo
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        
        // Deixar o fundo branco
        progressBar.trackTintColor = UIColor.white
    }
    
    
    // MARK: - Actions and functions
    // Action waterButton
    @IBAction func waterButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
        waterProgressView.progress += 1
    }
    
    // Action foodButton
    @IBAction func foodButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
    }
    
    // Action sleepButton
    @IBAction func sleepButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
        isSleeping = !isSleeping
        if isSleeping {
            sleepButton.setTitle("Acordar", for: .normal)
        } else {
            sleepButton.setTitle("Dormir", for: .normal)
        }
    }

    // MARK: Elements time update
    // Food time update
    @objc func foodUpdate() {
        if userSelectedSleepingTime == 8.0 {
            foodProgressView.progress += (50 / 11.520)
        } else {
            let calc = ((3.2 * self.userSelectedSleepingTime)/8.0) * 360.0
            let calc2 = 5.0 / calc
            foodProgressView.progress += Float(calc2)
        }
    }
    
    // Water time update
    @objc func waterUpdate() {
        if userSelectedSleepingTime == 8.0 {
            waterProgressView.progress += (50 / 10.800)
        } else {
            let calc = ((3.0 * self.userSelectedSleepingTime)/8.0) * 360.0
            let calc2 = 5.0 / calc
            waterProgressView.progress += Float(calc2)
        }
    }
    
    // Energy time update
    @objc func energyUpdate() {
        if isSleeping == true {
            energyProgressView.progress += 0.01
        } else {
            energyProgressView.progress -= 0.01
        }
    }
    
    // Happiness time update
    @objc func happinessUpdate() {
        happinessProgressView.progress -= 0.01
    }
    
    // MARK: Modal segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FoodController {
            controller.transitioningDelegate = self.slideTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
    }
}

