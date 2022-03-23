//
//  CustomTableViewCell.swift
//  aula_11_atividade
//
//  Created by Idwall Go Dev 001 on 21/03/22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        picture.layer.cornerRadius = picture.frame.height / 2
        picture.layer.masksToBounds = true
    }
    
    func setup(with person: Person) {
        picture.loadImage(from: person.photo)
        
        titleLabel.text = person.name
        
        contentLabel.text = person.company.name
    }
    
}
