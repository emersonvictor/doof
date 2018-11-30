//
//  DoofScene.swift
//  doof
//
//  Created by Emerson Victor on 30/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import WatchKit
import SpriteKit

class WatchScene: SKScene {
    
    // MARK: - Variables
    var doof: DoofNode? = nil
    
    // MARK: - Initializer
    override func sceneDidLoad() {
        self.doof = self.childNode(withName: "doof") as? DoofNode
        self.doof?.animate(withState: .idle)
    }
}
