//
//  ViewController.swift
//  aula07_desafio
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

struct User {
var name: String
var age: Int
}

class ViewController: UIViewController {

    @IBOutlet weak var tableViewHome: UITableView!
    
    var users: [User] = [User(name: "MIller", age: 32)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
    }
    
    func delegates() {
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewIdentifier" {
            if let  seconViewController = segue.destination as? SecondViewController {
                guard let user = sender as? User else { return }
                
                seconViewController.setup(user: user)
                
            }
            
        }
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
        performSegue(withIdentifier: "secondViewIdentifier", sender: user)
        print("Aqui")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = users[indexPath.row].name
        
        return cell
    }
    
    
}

