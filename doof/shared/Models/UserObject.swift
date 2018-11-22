//
//  User.swift
//  doof
//
//  Created by Emerson Victor on 22/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class UserObject {
    let username: String
    let mealsNumber: Float
    let sleepTime: Float
    let doof: DoofObject
    
    init(username: String, mealsNumber: Float, sleepTime: Float, doof: DoofObject) {
        self.username = username
        self.mealsNumber = mealsNumber
        self.sleepTime = sleepTime
        self.doof = doof
    }
}
