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
    var isSleeping = false
    let selectionFeedback = UISelectionFeedbackGenerator()
    lazy var slideTransitioningDelegate = SlidePresentationManager()
    var doofNode:DoofNode?
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDoofInfo()
    
        // Progress timers
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.updateDoofInfo()
        })
        
        // SpriteKit
        let scene = SKScene(fileNamed: "Main.sks")
        scene?.scaleMode = .aspectFill
        self.mainSKView.presentScene(scene)
        self.doofNode = self.mainSKView.scene?.childNode(withName: "doof") as? DoofNode
        self.doofNode?.animate(withState: UserSingleton.shared.doof!.state)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.willHideInteractionButtons(true)
        self.doofNode?.animate(withState: UserSingleton.shared.doof!.state)
        
        super.viewWillAppear(animated)
    }
    
    // MARK: - Update doof information
    func updateDoofInfo() {
        guard let user = UserSingleton.shared.user else {
            return
        }
        
        let sleepTime = user.sleepTime
        let meals = user.mealsNumber
        let awake = 24 - sleepTime
        
        // Water update
        let timeSpaceToDrink: Float = 0.6 / 7200
        waterProgressView.progress -= timeSpaceToDrink
        
        // Food update
        let timeSpaceToEat = (awake / meals) * 3600
        let fooodProgress = 0.8 / timeSpaceToEat
        foodProgressView.progress -= fooodProgress
        
        // Energy update
        if isSleeping == true {
            energyProgressView.progress += 1 / (3600 * sleepTime)
        } else {
            energyProgressView.progress -= 1 / (3600 * awake)
        }
        
        // Happiness update
        happinessProgressView.progress -= 1 / ((awake / 3) * 3600)
        
        // Set last time update
        UserSingleton.shared.doof?.lastTimeUpdated = Date()
    }
    
    func setDoofInfo() {
        if let user = UserSingleton.shared.user {
            let doof = user.doof
            
            self.happinessProgressView.progress = doof.happiness
            self.foodProgressView.progress = doof.food
            self.energyProgressView.progress = doof.energy
            self.waterProgressView.progress = doof.water
        }
    }
    
    // MARK: - Modal segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FoodController {
            controller.transitioningDelegate = self.slideTransitioningDelegate
            controller.modalPresentationStyle = .custom
        } else if let _ = segue.destination as? StatisticsController {
            self.selectionFeedback.selectionChanged()
        }
    }
}
