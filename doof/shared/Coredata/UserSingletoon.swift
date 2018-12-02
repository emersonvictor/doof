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
        self.user = UserObject(username: "Emerson", mealsNumber: 6, sleepTime: 7, doof: DoofObject(food: 1, water: 1, happiness: 1, energy: 1, foodHistory: [], waterHistory: [], state: .idle))
        self.doof = self.user!.doof
    }
}

