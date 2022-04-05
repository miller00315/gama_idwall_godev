//
//  ViewController.swift
//  AppUserDefault
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = UserDefaults()
    
    lazy var setValueButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("set value", for: .normal)
        
        button.backgroundColor = .systemIndigo
        
        button.addTarget(self, action: #selector(setUserDefaults), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    lazy var getValueButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("get value", for: .normal)
        
        button.backgroundColor = .black
        
        button.addTarget(self, action: #selector(getUserDefaults), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        view.addSubview(setValueButton)
        view.addSubview(getValueButton)
        
        NSLayoutConstraint.activate([
            setValueButton.heightAnchor.constraint(equalToConstant: 45),
            setValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            setValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            getValueButton.heightAnchor.constraint(equalToConstant: 45),
            getValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            getValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getValueButton.topAnchor.constraint(equalTo: setValueButton.bottomAnchor, constant: 16)
        ])
    }
    
    @IBAction func setUserDefaults() {
        print("SET")
        defaults.setValue("OI", forKey: "time")
    }

    @IBAction func getUserDefaults() {
        let time = defaults.value(forKey: "time")
        
        if let time = time {
            print(time)
        }
    }
}

