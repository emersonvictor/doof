//
//  CoreDataManager.swift
//  doof
//
//  Created by Emerson Victor on 22/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    let appDelegate: AppDelegate
    let context: NSManagedObjectContext
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
}
