//
//  WKMainController.swift
//  doof WatchKit Extension
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import WatchKit
import Foundation
import SpriteKit

class WKMainController: WKInterfaceController {
    
    // MARK: - Outlets
    @IBOutlet var doofScene: WKInterfaceSKScene!
    
    // MARK: - Variables
    var watchScene: WatchScene!
    
    // MARK: - Initializer
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let scene = WatchScene(fileNamed: "MainWatch") {
            self.watchScene = scene
            scene.scaleMode = .aspectFill
            
            self.doofScene.presentScene(scene)
        }
    }
    
    // MARK: - Animate doof
    func animateDoof(withState state: DoofStates) {
        switch state {
        case .eating:
            print("Doof is eating")
        case .drinking:
            print("Doof is drinking")
        case .sleeping:
            print("Doof is sleeping")
        case .smiling:
            print("Doof is smiling")
        case .idle:
            print("Doof is smiling")
        }
    }
    
    // MARK: - Menu actions
    @IBAction func foodAction() {
        self.presentController(withName: "MealController", context: nil)
    }
    
    @IBAction func waterAction() {
        print("You give water to doof")
    }
    
    @IBAction func sleepAction() {
        print("Doof is now sleeping")
    }
}
