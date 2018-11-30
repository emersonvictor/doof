//
//  MainProgressBar.swift
//  doof
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class MainProgressBar: UIProgressView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.sublayers![1].cornerRadius = 5
        self.subviews[1].clipsToBounds = true
        self.trackTintColor = UIColor.white
    }
}
