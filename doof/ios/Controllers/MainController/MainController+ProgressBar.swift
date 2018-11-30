//
//  MainController+ProgressBar.swift
//  doof
//
//  Created by Emerson Victor on 29/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation

// MARK: - Progress update
extension MainController {
    // Water time update
    @objc func waterUpdate() {
        let timeSpaceToDrink: Float = 0.6 / 7200
        waterProgressView.progress -= timeSpaceToDrink
    }
    
    // Food time update
    @objc func foodUpdate() {
        let timeSpaceToEat = (awake! / userMeals!) * 3600
        let fooodProgress = 0.8 / timeSpaceToEat
        foodProgressView.progress -= fooodProgress
    }
    
    // Energy time update
    @objc func energyUpdate() {
        if isSleeping == true {
            energyProgressView.progress += 1 / (3600 * userSleepingTime!)
        } else {
            energyProgressView.progress -= 1 / (3600 * awake!)
        }
    }
    
    // Happiness time update
    @objc func happinessUpdate() {
        happinessProgressView.progress -= 1 / ((awake! / 3) * 3600)
    }
}
