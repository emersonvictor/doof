//
//  MainController+Actions.swift
//  doof
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interaction buttons
extension MainController {
    @IBAction func waterButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
        waterProgressView.progress += 0.1
    }
    
    // Action foodButton
    @IBAction func foodButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
    }
    
    // Action sleepButton
    @IBAction func sleepButtonAction(_ sender: Any) {
        self.selectionFeedback.selectionChanged()
        isSleeping = !isSleeping
        if isSleeping {
            self.doofNode?.animate(withState: .idle)
            sleepButton.setTitle("Acordar", for: .normal)
        } else {
            self.doofNode?.animate(withState: .sleeping)
            sleepButton.setTitle("Dormir", for: .normal)
        }
    }
    
    // Main Button Interaction
    @IBAction func mainAction(_ sender: CircleButton) {
        sender.isSelected = !sender.isSelected
        sender.setSelectedState()
        self.willHideInteractionButtons(!sender.isSelected)
        self.selectionFeedback.selectionChanged()
    }
    
    func willHideInteractionButtons(_ hide: Bool) {
        if hide {
            UIView.animate(withDuration: 0.2) {
                let x: CGFloat = 60
                let y: CGFloat = 50
                self.waterButton.transform = CGAffineTransform(translationX: x, y: y)
                self.foodButton.transform = CGAffineTransform(translationX: 0, y: 60)
                self.sleepButton.transform = CGAffineTransform(translationX: -x, y: y)
                
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.waterButton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.foodButton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.sleepButton.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
}
