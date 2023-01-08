//
//  ConsolesManager.swift
//  MyGames
//
//  Created by Daianne Aguiar on 08/01/23.
//  Copyright © 2023 User. All rights reserved.
//

import CoreData

class ConsolesManager {
    static let shared = ConsolesManager()
    
    var consoles: [Console] = []
    
    func loadConsoles(with context: NSManagedObjectContext) {
        let fecthRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let shortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fecthRequest.sortDescriptors = [shortDescriptor]
        do {
            consoles = try context.fetch(fecthRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init() { }
}
