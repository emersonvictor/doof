//
//  Doof.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class DoofObject {
    var food: Float
    var water: Float
    var happiness: Float
    var energy: Float
    var foodHistory: [FoodstampObject]
    var waterHistory: [WaterstampObject]
    var state: DoofStates
    var lastTimeUpdated: Date
    
    // MARK: - Initializer
    init(food: Float, water: Float, happiness: Float, energy: Float, foodHistory: [FoodstampObject], waterHistory: [WaterstampObject], state: DoofStates = .idle){
        self.food = food
        self.water = water
        self.happiness = happiness
        self.energy = energy
        self.foodHistory = foodHistory
        self.waterHistory = waterHistory
        self.state = state
        self.lastTimeUpdated = Date()
    }
}
