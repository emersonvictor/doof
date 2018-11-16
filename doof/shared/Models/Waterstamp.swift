//
//  Water Stamp.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class Waterstamp {
    
    var time : Date
    var quantity: Int
    
    // MARK: - Initializer 
    init(time: Date, quantity: Int){
        self.time = time
        self.quantity = quantity
    }
    
    // MARK: - Save model to CoreData
    func save() {
        
    }
}
