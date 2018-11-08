//
//  Food Stamp.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class FoodStamp {
    
    var time : Date
    var meal : Meal
    var healthy : Healthiness
    // var petRef : PetId
    
    init(time: Date, meal: Meal, healthy: Healthiness){
        self.time = time
        self.meal = meal
        self.healthy = healthy
    }
}
