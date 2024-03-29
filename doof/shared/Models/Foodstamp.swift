//
//  Food Stamp.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class FoodstampObject {
    
    var time: Date
    var meal: Meal
    var healthiness : Healthiness
    
    // MARK: - Initializer
    init(time: Date, meal: Meal, healthiness: Healthiness){
        self.time = time
        self.meal = meal
        self.healthiness = healthiness
    }
    
    // MARK: - Save model to CoreData
    func save() {
        
    }
}
