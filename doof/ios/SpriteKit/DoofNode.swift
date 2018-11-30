//
//  DoofNode.swift
//  doof
//
//  Created by João Melo on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit
import SpriteKit
import WatchKit

class DoofNode: SKSpriteNode {
    
    var doofFrames:[SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "idle.atlas/1.png")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.isUserInteractionEnabled = true
        self.name = "doofMain"
        self.animate(withState: .idle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
        self.animate(withState: .idle)
    }
    
    func animate(withState state: DoofStates) {
        // Texture animation
        var frames:[SKTexture] = []
        let doofAtlas = SKTextureAtlas(named: state.rawValue)
    
        for index in 1 ... 5 {
            let textureName = "\(state.rawValue)\(index)"
            let texture = doofAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        switch state {
        case .idle:
            for index in stride(from:5,through:1,by:-1)  {
                let textureName = "\(state.rawValue)\(index)"
                let texture = doofAtlas.textureNamed(textureName)
                frames.append(texture)
            }
        case .smiling:
            break
        case .eating:
            break
        case .drinking:
            break
        case .sleeping:
            break
        }
        
        self.doofFrames = frames
        self.run(SKAction.repeatForever(SKAction.animate(with: self.doofFrames!, timePerFrame: 0.1, resize: false, restore: true)))
    }
    
    // MARK: - Touch animation
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeAllActions()
        self.animate(withState: .smiling)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeAllActions()
        self.animate(withState: .idle)
    }
}
