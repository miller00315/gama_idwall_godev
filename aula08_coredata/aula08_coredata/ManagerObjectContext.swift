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
    func Delete(id: UUID, onCompletionHandler: OnCompletionHandler)
}

protocol managedUpdateProtocol {
    func Update(person: Person, onCompletionHandler: OnCompletionHandler)
}

class ManagedObjectContext:
        managedProtocol,
        managedSaveProtocol,
        managedDeleteProtocol,
        managedUpdateProtocol {
    
    private let entity = "Uses"
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func Save(person: Person, onCompletionHandler: OnCompletionHandler) {
        
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
    
    func Delete(id: UUID, onCompletionHandler: OnCompletionHandler) {
        
    }
    
    func Update(person: Person, onCompletionHandler: OnCompletionHandler) {
        
    }
}
