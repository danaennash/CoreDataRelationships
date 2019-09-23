//
//  Expense+CoreDataClass.swift
//  Documents Core Data Relationships
//
//  Created by Danae N Nash on 9/23/19.
//  Copyright © 2019 Danae N Nash. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, amount: Double, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Expense.entity(), insertInto: context)
        
        self.name = name
        self.amount = amount
        self.date = date
    }
    
}
