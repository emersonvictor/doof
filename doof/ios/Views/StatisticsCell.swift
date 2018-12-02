//
//  StatisticsCell.swift
//  doof
//
//  Created by Emerson Victor on 28/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class StatisticsCell: UICollectionViewCell {

    // Title outlet
    @IBOutlet weak var dateLabel: UILabel!
    
    // Bars outlets
    @IBOutlet weak var veryHealthyBar: UIProgressView!
    @IBOutlet weak var healthyBar: UIProgressView!
    @IBOutlet weak var lessHealthyBar: UIProgressView!
    @IBOutlet weak var unhealthyBar: UIProgressView!
    
    // Labels outlets
    @IBOutlet weak var veryHealthyLabel: UILabel!
    @IBOutlet weak var healthyLabel: UILabel!
    @IBOutlet weak var lessHealthyLabel: UILabel!
    @IBOutlet weak var unhealhtyLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
