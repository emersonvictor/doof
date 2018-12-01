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
        
        if context != nil {
            self.watchScene.doof?.animate(withState: .eating)
        }
    }
    
    // MARK: - Menu actions
    @IBAction func foodAction() {
        self.presentController(withName: "MealController", context: nil)
    }
    
    @IBAction func waterAction() {
        self.watchScene.doof?.animate(withState: .drinking)
    }
    
    @IBAction func sleepAction() {
        self.watchScene.doof?.animate(withState: .sleeping)
    }
}
