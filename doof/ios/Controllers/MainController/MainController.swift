//
//  ViewController.swift
//  doof
//
//  Created by Emerson Victor on 01/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import SpriteKit
import UIKit

class MainController: UIViewController {
    
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
    
    // MARK: Variables
    // Timers
    var foodTimer = Timer()
    var waterTimer = Timer()
    var happinessTimer = Timer()
    var energyTimer = Timer()
    // Sleeping state
    var isSleeping = false
    // User information
    var userSleepingTime: Float? = 8
    var userMeals: Float? = 5
    var awake: Float?
    // Haptic Feedback
    let selectionFeedback = UISelectionFeedbackGenerator()
    // Slide transition
    lazy var slideTransitioningDelegate = SlidePresentationManager()
    // DoofNode
    var doofNode:DoofNode?
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        self.awake = 24 - userSleepingTime!
        
        
        // Progress timers
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
        let scene = SKScene(fileNamed: "Main.sks")
        scene?.scaleMode = .aspectFill
        self.mainSKView.presentScene(scene)
        self.doofNode = self.mainSKView.scene?.childNode(withName: "doof") as? DoofNode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.willHideInteractionButtons(true)
        
        super.viewWillAppear(animated)
    }

    // MARK: - Progress Bar customization
    func customProgessBars(progressBar: UIProgressView) {
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        progressBar.trackTintColor = UIColor.white
    }
    
    // MARK: Modal segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FoodController {
            controller.transitioningDelegate = self.slideTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
    }
}
