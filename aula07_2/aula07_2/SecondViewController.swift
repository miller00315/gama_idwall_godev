//
//  SecondViewController.swift
//  aula07_2
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var property: Data?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let property = property {
            print("Este é o valor danado \(property.name) \(property.age)" )
        }
    }
    
    func setData (property: Data) {
        self.property = property
    }

}
