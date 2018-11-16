//
//  Pet.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class Pet {
    
    var name : String
    var food : Int
    var water : Int
    var happiness : Int
    var energy : Int
    var foodHistory : [Foodstamp]
    var waterHistory : [Waterstamp]
    
    // MARK: - Initializer
    init(name: String, food: Int, water: Int, happiness: Int, energy: Int, foodHistory: [Foodstamp], waterHistory: [Waterstamp]){
        self.name = name
        self.food = food
        self.water = water
        self.happiness = happiness
        self.energy = energy
        self.foodHistory = foodHistory
        self.waterHistory = waterHistory
    }
}
