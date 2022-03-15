//
//  CustomTableViewCell.swift
//  aula_06_1
//
//  Created by Idwall Go Dev 001 on 14/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func setup(logo: String, name: String, description: String) {
        
        logoImageView.image = UIImage(systemName: logo)
        nameLabel.text = name
        descriptionLabel.text = description
    }

}
