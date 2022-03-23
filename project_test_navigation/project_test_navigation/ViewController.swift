//
//  ViewController.swift
//  project_test_navigation
//
//  Created by Idwall Go Dev 001 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
        
        title = "Chamador"
    }

    @IBAction func callNextApp(_ sender: Any) {
        let customUrl = "deep-link://product/9999"
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
}

