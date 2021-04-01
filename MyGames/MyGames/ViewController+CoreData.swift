//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by User on 01/04/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
