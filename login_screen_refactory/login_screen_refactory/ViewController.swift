//
//  ViewController.swift
//  login_screen_refactory
//
//  Created by Idwall Go Dev 001 on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "airplane")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        setSubViews()
        
        setIcon()
        
        title = "Login"
        
        view.backgroundColor = .white
    }
    
    private func setSubViews() {
        
        addSubviews(icon)
    }
    
    private func setIcon() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }


}

