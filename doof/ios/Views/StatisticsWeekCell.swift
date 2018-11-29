//
//  StatisticsWeekCell.swift
//  doof
//
//  Created by Emerson Victor on 28/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class StatisticsWeekCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set drop shadow
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 15
        
        
    }
}
