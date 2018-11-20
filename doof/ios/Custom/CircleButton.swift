//
//  CircleButton.swift
//  doof
//
//  Created by Emerson Victor on 19/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

@IBDesignable class CircleButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        self.isHighlighted = false
        // Shadow setup
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.setSelectedState()
    }
    
    func setSelectedState() {
        if self.isSelected {
            UIView.animate(withDuration: 0.6) {
                self.layer.shadowOpacity = 0.43
                self.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.layer.shadowRadius = 3
            }
        } else {
            UIView.animate(withDuration: 0.6) {
                self.layer.shadowOpacity = 0.25
                self.layer.shadowOffset = CGSize(width: 0, height: 4)
                self.layer.shadowRadius = 8
            }
        }
    }
}
