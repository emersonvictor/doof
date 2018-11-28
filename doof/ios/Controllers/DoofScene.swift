//
//  GuiozaScene.swift
//  doof
//
//  Created by João Melo on 21/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit
import SpriteKit

class DoofScene: SKScene {

    var doofFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        // Texture animation
        var frames:[SKTexture] = []
        
        let doofAtlas = SKTextureAtlas(named: "Doof")
        
        for index in 1 ... 5 {
            let textureName = "\(index)"
            let texture = doofAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        self.doofFrames = frames
    }
    
    func animateDoof() {
        let texture = self.doofFrames![0]
        let doof = SKSpriteNode(texture: texture)
        
        doof.size = CGSize(width: 200, height: 250)
        
        let doofX = self.frame.size.width / 2
        let doofY = self.frame.size.height / 2
        
        doof.position = CGPoint(x: doofX, y: doofY)
        
        self.addChild(doof)
        
        doof.run(SKAction.repeatForever(SKAction.animate(with: self.doofFrames!, timePerFrame: 0.1, resize: false, restore: true)))
        
    }
    
    
    
    

    
}
