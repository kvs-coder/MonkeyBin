//
//  DBInterface.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 06.06.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import Foundation
import CoreData

internal class DBInterface {
    
    static private var dataModelName = "GameModel"
    
    static private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: dataModelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private static var context: NSManagedObjectContext = persistentContainer.viewContext
    
    public static func saveContext() {
        if self.context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    public static func createObject<T : NSManagedObject>(of entity: T.Type) -> T? {
        let entityName = String(describing: entity)
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: self.context) else { return nil }
        let object = T(entity: entity, insertInto: context)
        return object
    }
    
    public static func getObject<T: NSManagedObject>(of entity: T.Type, with predicate: NSPredicate? = nil) -> T? {
        let entityName = String(describing: entity)
        let request : NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result.first
        } catch {
            print("Failed to get object: \(error)")
        }
        return nil
    }
    
    public static func queryObjects<T: NSManagedObject>(entity: T.Type, with predicate: NSPredicate? = nil) -> [T] {
        let entityName = String(describing: entity)
        let request : NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed quering objects: \(error)")
        }
        return []
    }
    
    public static func deleteObject<T: NSManagedObject>(_ object: T) {
        context.delete(object)
    }
    
}

