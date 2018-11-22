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
    let coreDataManager = CoreDataManager()
    let user: User?
    let doof: Doof?
    
    private init() {
        self.user = nil
        self.doof = nil
    }
}

