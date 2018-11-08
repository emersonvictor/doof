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
    
    // Food Timer
    var foodTimer = Timer()
    
    // Water Timer
    var waterTimer = Timer()
    
    // Happiness Timer
    var happinessTimer = Timer()
    
    // Energy Timer
    var energyTimer = Timer()
    
    // Sleep Bool
    var isSleeping = false
    
    
    
    
    
    // MARK: Outlets
    
    // Outlet Scenery SKView
    @IBOutlet weak var scenerySKView: SKView!
    
    // Outlet Character SKView
    @IBOutlet weak var characterSKView: SKView!
    
    // Outlet Food ProgressView
    @IBOutlet weak var foodProgressView: UIProgressView!
    
    // Outlet Water ProgressView
    @IBOutlet weak var waterProgressView: UIProgressView!
    
    // Outlet Happiness ProgressView
    @IBOutlet weak var happinessProgressView: UIProgressView!
    
    // Outlet Energy ProgressView
    @IBOutlet weak var energyProgressView: UIProgressView!
    
    // Outlet Food Button
    @IBOutlet weak var foodButton: UIButton!
    
    // Outlet Water Button
    @IBOutlet weak var waterButton: UIButton!
    
    // Outlet Sleep Button
    @IBOutlet weak var sleepButton: UIButton!
    
    // Outlet Goals Button
    @IBOutlet weak var goalsButton: UIButton!
    
    // Outlet Graphics Button
    @IBOutlet weak var graphicsButton: UIButton!
    
    @IBOutlet weak var shitpost: UILabel!
    
    
    
    
    
    // MARK: Actions & Funcs
    
    // Action foodButton
    @IBAction func foodButtonAction(_ sender: Any) {
        shitpost.isHidden = false
    }
    
    // Action waterButton
    @IBAction func waterButtonAction(_ sender: Any) {
        waterProgressView.progress += 1
    }
    
    // Action sleepButton
    @IBAction func sleepButtonAction(_ sender: Any) {
        isSleeping = !isSleeping
        if isSleeping {
            sleepButton.setTitle("Acordar", for: .normal)
        } else {
            sleepButton.setTitle("Dormir", for: .normal)
        }
    }
    
    // Action pet character
    @IBAction func petTapGesture(_ sender: Any) {
        happinessProgressView.progress += 0.05
    }
    
    
    
    
    
    // MARK: Elements time update
    
    // Food time update
    @objc func foodUpdate() {
        foodProgressView.progress -= 0.01
    }
    
    // Water time update
    @objc func waterUpdate() {
        waterProgressView.progress -= 0.01
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shitpost.isHidden = true
        
        // Food Progress
        self.foodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.foodUpdate), userInfo: nil, repeats: true)
        
        // Water Progress
        self.waterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.waterUpdate), userInfo: nil, repeats: true)
        
        // Energy Progress
        self.waterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.energyUpdate), userInfo: nil, repeats: true)
        
        // Happiness Progress
        self.happinessTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.happinessUpdate), userInfo: nil, repeats: true)
        
    }
    
    
}

