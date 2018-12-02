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
        
        let singletonDoof = UserSingleton.shared.doof!
        self.watchScene.doof?.animate(withState: singletonDoof.state)
    }
    
    // MARK: - Menu actions
    @IBAction func foodAction() {
        self.presentController(withName: "MealController", context: nil)
    }
    
    @IBAction func waterAction() {
        let singletonDoof = UserSingleton.shared.doof!
        singletonDoof.state = .drinking
        self.watchScene.doof?.animate(withState: singletonDoof.state)
    }
    
    @IBAction func sleepAction() {
        let singletonDoof = UserSingleton.shared.doof!
        singletonDoof.state = .sleeping
        self.watchScene.doof?.animate(withState: singletonDoof.state)
    }
}
