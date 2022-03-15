//
//  ViewController.swift
//  aula07_2
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

struct Data {
    var name: String;
    var age: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "View controller"
    }

    @IBAction func navigatToSecondView(_ sender: Any) {
        
        let sender = Data(name: "Miller", age: 32)
        
        performSegue(withIdentifier: "secondViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewController" {
            
            if let  seconViewController = segue.destination as? SecondViewController {
                
                guard let data = sender as? Data else { return }
                
                seconViewController.setData(property: data)
                
               print("dentro da secondview \(seconViewController)")
            }
        }
    }
    
}

