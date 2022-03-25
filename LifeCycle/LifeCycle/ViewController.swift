//
//  ViewController.swift
//  LifeCycle
//
//  Created by Idwall Go Dev 001 on 24/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Did disappear")
    }
    
    @IBAction func nextScrenn(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueUseView", sender: nil)
    }
    
    
    
}

