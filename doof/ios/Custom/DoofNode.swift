//
//  DoofNode.swift
//  doof
//
//  Created by João Melo on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit
import SpriteKit

class DoofNode: SKSpriteNode {
    
    var doofFrames:[SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "Doof.atlas/1.png")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "doofMain"
        self.isUserInteractionEnabled = true
        self.animateDoof()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
        self.animateDoof()
    }
    
    func animateDoof() {
        
        // Texture animation
        var frames:[SKTexture] = []
        
        let doofAtlas = SKTextureAtlas(named: "Doof")
        
        for index in 1 ... 5 {
            let textureName = "\(index)"
            let texture = doofAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        for index in stride(from:5,through:1,by:-1)  {
            let textureName = "\(index)"
            let texture = doofAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.doofFrames = frames
        
        self.run(SKAction.repeatForever(SKAction.animate(with: self.doofFrames!, timePerFrame: 0.1, resize: false, restore: true)))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeAllActions()
        var frames:[SKTexture] = []
        
        let doofAtlas = SKTextureAtlas(named: "Doof_Smiling")
        
        for index in 1 ... 5 {
            let textureName = "\(index)"
            let texture = doofAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.doofFrames = frames
        
        self.run(SKAction.repeatForever(SKAction.animate(with: self.doofFrames!, timePerFrame: 0.1, resize: false, restore: true)))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.removeAllActions()
        self.animateDoof()
    }
    
    
    
    
    
    
    
    
    
}
