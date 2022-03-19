//
//  ViewController.swift
//  aula08_coredata
//
//  Created by Idwall Go Dev 001 on 17/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var refresher: UIRefreshControl!
    
    var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
    }
    
    func delegates () {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
 
    @IBAction func deleteButton(_ sender: Any) {
        
        let id = "31F7FAE2-BE13-46FE-A5FA-A60780BD5C47"
        
        ManagedObjectContext.shared.Delete(uuid: id) { result in
            print("deletado")
        }
    }
    
    @IBAction func list(_ sender: Any) {
        
        let personList = ManagedObjectContext.shared.GetPersons()
        
        self.persons = personList
    
    }
    
    @IBAction func add(_ sender: Any) {
        
        let person: Person = Person(id: UUID(), name: "na", lastName: "hj", age: 10)
        
        ManagedObjectContext.shared.Save(person: person) { result in
            print(result)
        }
    }
    
}

extension ViewController: UITableViewDelegate {}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = UITableViewCell()
        
        print(persons[indexPath.row].name)
        
        cell.textLabel?.text = persons[indexPath.row].name
        
        return cell
    }
    
    
}

