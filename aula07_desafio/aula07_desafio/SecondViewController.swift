//
//  SecondViewController.swift
//  aula07_desafio
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    static var identifier = "SecondViewController"
    
    var user: User?

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen()
    }
    
    func setup(user: User) {
        
        self.user = user
    }
    
    func setUpScreen() {
        nameLabel.text = "Nome: \(user?.name ?? "")"
        
        ageLabel.text = "Idade: \(user?.age ?? 0)"
    }

}
