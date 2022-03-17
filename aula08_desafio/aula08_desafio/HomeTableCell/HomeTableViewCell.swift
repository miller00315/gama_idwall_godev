//
//  HomeTableViewCell.swift
//  aula08_desafio
//
//  Created by Idwall Go Dev 001 on 16/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static var identifier = "HomeTableViewCell"

    @IBOutlet weak var homeTabViewImage: UIImageView!
    
    @IBOutlet weak var homeTAbleViewTitle: UILabel!
    
    @IBOutlet weak var homeTableViewContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: String, title: String, content: String) {
        if let image = UIImage(named: image) {
            homeTabViewImage.image = image
        }
        
        homeTAbleViewTitle.text = title
        
        homeTableViewContent.text = content
    }
    
}
