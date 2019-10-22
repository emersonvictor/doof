//
//  StatisticsWeekCell.swift
//  doof
//
//  Created by Emerson Victor on 28/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class StatisticsWeekCell: UICollectionViewCell {
    
    
    // Bars outlets
    @IBOutlet weak var veryHealthyBar: UIProgressView!
    @IBOutlet weak var healthyBar: UIProgressView!
    @IBOutlet weak var lessHealthyBar: UIProgressView!
    @IBOutlet weak var unhealthyBar: UIProgressView!
    
    // Labels outlets
    @IBOutlet weak var veryHealthyLabel: UILabel!
    @IBOutlet weak var healthyLabel: UILabel!
    @IBOutlet weak var lessHealthyLabel: UILabel!
    @IBOutlet weak var unhealthyLabel: UILabel!
    
    
    
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
