//
//  ViewController.swift
//  aula05_1
//
//  Created by Idwall Go Dev 001 on 11/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var autheticateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        
        let text = emailTextField.text
        
        print("Estou logando \(text ?? "Não")")
        
        guard passwordTextField.text != nil else {
            print("Nao deu")
            return
        }
        let alert = UIAlertController(title: "login", message: "Oi", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirma", style: .default, handler: { action in
            print("ok confirmado")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { cnacel in
            print("Vocë clicou em cancelar")
        }))
        
        alert.addAction(UIAlertAction(title: "Destrutivo", style: .destructive, handler: { UIAlertActiondestructive in
            print("Voce clicou no destrutivo")
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

