//
//  SecondViewController.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 001 on 25/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var idProduct: String?
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        
        button.tintColor = .red
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let idProduct = idProduct {
            print(idProduct)
        }

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    @IBAction func closeModal() {
        dismiss(animated: true) {
            print("Fechou")
        }
    }

}
