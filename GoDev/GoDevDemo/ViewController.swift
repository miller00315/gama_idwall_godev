//
//  ViewController.swift
//  GoDevDemo
//
//  Created by Idwall Go Dev 001 on 29/03/22.
//

import UIKit
import GoDev

class ViewController: UIViewController {
    
    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.dark()
        
        let button = GoDevButton(config: config);
        
        button.setTitle("Botao", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    } ()
    
    lazy var contet: GoDevView = {
        let view = GoDevView(bg: .red)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        title = "Home"
        
        view.addSubview(button)
        view.addSubview(contet)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contet.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contet.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

