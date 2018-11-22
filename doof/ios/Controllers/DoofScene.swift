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

    var guiozaFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.white
        var frames:[SKTexture] = []
        
        let guiozaAtlas = SKTextureAtlas(named: "Guioza")
        
        for index in 1 ... 5 {
            let textureName = "\(index)"
            let texture = guiozaAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.guiozaFrames = frames
        
    }
    
    func jumpGuioza() {
        let texture = self.guiozaFrames![0]
        let guioza = SKSpriteNode(texture: texture)
        
        guioza.size = CGSize(width: 200, height: 250)
        
        let guiozaX = self.frame.size.width / 2
        let guiozaY = self.frame.size.height / 2
        
        guioza.position = CGPoint(x: guiozaX, y: guiozaY)
        
        self.addChild(guioza)
        
        guioza.run(SKAction.repeatForever(SKAction.animate(with: self.guiozaFrames!, timePerFrame: 0.1, resize: false, restore: true)))
        
    }
    
    
    
    

    
}
