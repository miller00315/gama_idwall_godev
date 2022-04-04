//
//  ViewController.swift
//  CoordinatorApp
//
//  Created by Idwall Go Dev 001 on 04/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    
    lazy var button: UIButton = {
        let button = UIButton(type: .close)
        
        button.tintColor = .red
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(getDetails), for: .touchUpInside)
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = viewModel?.title
        
        configureUI()
    }
    
    @IBAction func getDetails() {
        viewModel?.tapDetails()
    }
    
    private func configureUI() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: 45),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

