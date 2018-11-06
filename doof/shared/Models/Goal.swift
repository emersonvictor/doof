//
//  Goals.swift
//  doof
//
//  Created by João Melo on 06/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class Goal {
    
    var name : String
    var repetition : [Day]
    var dayStreak : Int
    var status : Bool
    //var petRef : [PetId]
    
    init(name: String, repetition: [Day], dayStreak: Int, status: Bool){
        self.name = name
        self.repetition = repetition
        self.dayStreak = dayStreak
        self.status = status
    }
}
