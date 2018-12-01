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
    // Bars limit
    let limit: CGFloat = 80
    // Barss
    var bar: SKNode? = nil
    var food: SKNode? = nil
    var energy: SKNode? = nil
    var water: SKNode? = nil
    
    // MARK: - Initializer
    override func sceneDidLoad() {
        // Animate doof
        self.doof = self.childNode(withName: "doof") as? DoofNode
        self.doof?.animate(withState: .idle)
        
        // Setup progress bar
        self.drawProgressBars(happinessWidth: limit*0.5, foodWidth: limit*0.8, energyWidth: limit*1, waterWidth: limit*0.2)
    }
    
    func drawProgressBars(happinessWidth: CGFloat, foodWidth: CGFloat, energyWidth: CGFloat, waterWidth: CGFloat) {
        
        // SKS Progress bars
        let progressHappiness = self.childNode(withName: "progressHappiness")
        let progressFood = self.childNode(withName: "progressFood")
        let progressEnergy = self.childNode(withName: "progressEnergy")
        let progressWater = self.childNode(withName: "progressWater")
        
        
        
        if let progress = progressHappiness {
            let bar = SKShapeNode(rectOf: CGSize(width: happinessWidth, height: 4), cornerRadius: 2)
            bar.position = CGPoint(x: -54 + happinessWidth/2, y: progress.position.y)
            bar.fillColor = UIColor.darkPink
            bar.strokeColor = UIColor.clear
            self.addChild(bar)
        }
        
        if let progress = progressFood {
            let bar = SKShapeNode(rectOf: CGSize(width: foodWidth, height: 4), cornerRadius: 2)
            bar.position = CGPoint(x: -54 + foodWidth/2, y: progress.position.y)
            bar.fillColor = UIColor.darkPink
            bar.strokeColor = UIColor.clear
            self.addChild(bar)
        }
        
        if let progress = progressEnergy {
            let bar = SKShapeNode(rectOf: CGSize(width: energyWidth, height: 4), cornerRadius: 2)
            bar.position = CGPoint(x: -54 + energyWidth/2, y: progress.position.y)
            bar.fillColor = UIColor.darkPink
            bar.strokeColor = UIColor.clear
            self.addChild(bar)
        }
        
        if let progress = progressWater {
            let bar = SKShapeNode(rectOf: CGSize(width: waterWidth, height: 4), cornerRadius: 2)
            bar.position = CGPoint(x: -54 + waterWidth/2, y: progress.position.y)
            bar.fillColor = UIColor.darkPink
            bar.strokeColor = UIColor.clear
            self.addChild(bar)
        }
    }
    
    
}
