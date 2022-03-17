//
//  AboutViewController.swift
//  aula08_desafio
//
//  Created by Idwall Go Dev 001 on 16/03/22.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutImage: UIImageView!
    
    @IBOutlet weak var aboutTitle: UILabel!
    
    @IBOutlet weak var aboutContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sobre"
        
        setup()
    }
    
    func setup() {
        aboutImage.image = UIImage(named: "casa-1")
        
        aboutTitle.text = "Casa"
        
        aboutContent.text = "Olá tudo bem?"
    }

}
