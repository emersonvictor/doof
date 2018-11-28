//
//  StatisticsController.swift
//  doof
//
//  Created by Emerson Victor on 28/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class StatisticsController: UIViewController {
    
    // MARK: - Initializers
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        super.viewWillAppear(animated)
    }
}
