//
//  UserSingletoon.swift
//  doof
//
//  Created by Emerson Victor on 22/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

class UserSingleton {
    static let shared = UserSingleton()
    let user: UserObject?
    let doof: DoofObject?
    #if os(iOS)
        let coreDataManager = CoreDataManager()
    #endif
    
    private init() {
        self.user = UserObject(username: "Emerson", mealsNumber: 6, sleepTime: 7, doof: DoofObject(food: 0.2, water: 0.9, happiness: 1, energy: 0.7, foodHistory: [], waterHistory: [], state: .idle))
        self.doof = self.user!.doof
    }
}

