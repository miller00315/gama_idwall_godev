//
//  ManagerObjectContext.swift
//  aula08_coredata
//
//  Created by Idwall Go Dev 001 on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias OnCompletionHandler = (String) -> Void

protocol managedProtocol {
    func GetPersons() -> [Person]
}

protocol managedSaveProtocol {
    func Save(person: Person, onCompletionHandler: OnCompletionHandler)
}

protocol managedDeleteProtocol {
    func Delete(uuid: String, onCompletionHandler: OnCompletionHandler)
}

protocol managedUpdateProtocol {
    func Update(person: Person, onCompletionHandler: OnCompletionHandler)
}

class ManagedObjectContext:
        managedProtocol,
        managedSaveProtocol,
        managedDeleteProtocol,
        managedUpdateProtocol {
    
    private let entity = "Users"
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func Save(person: Person, onCompletionHandler: OnCompletionHandler) {
        
        let context  = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context)
            else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        do {
            try context.save()
            
            onCompletionHandler("Save success")
            
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
        
    }
    
    func GetPersons() -> [Person] {
        var listPerson: [Person] = []
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        do {
            
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject]
                else { return listPerson }
            
            for item in persons {
                if let id = item.value(forKey: "id") as? UUID,
                   let name = item.value(forKey: "name") as? String,
                   let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    
                    listPerson.append(person)
                }
            }
            
        } catch let error as NSError {
            print("Erro requesr \(error.localizedDescription)")
        }
        
        
        return listPerson
    }
    
    func Delete(uuid: String, onCompletionHandler: OnCompletionHandler) {
        let context = getContext()
        
        let predicate = NSPredicate(format: "id == %@", "\(uuid)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        fetchRequest.predicate = predicate
        
        do {
            
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let enetityDelete = fetchResults.first {
                context.delete(enetityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete success")
            
        } catch let error as NSError {
            print("Fetch faile: \(error.localizedDescription)")
        }
    }
    
    func Update(person: Person, onCompletionHandler: OnCompletionHandler) {
        
    }
}
