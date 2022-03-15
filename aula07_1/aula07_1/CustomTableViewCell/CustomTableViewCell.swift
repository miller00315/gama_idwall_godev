//
//  CustomTableViewCell.swift
//  aula07_1
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customTableViewImage: UIImageView!
    
    @IBOutlet weak var customTableViewTitle: UILabel!
    
    @IBOutlet weak var customTableViewContent: UILabel!
    
    static let identifier = "CustomTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: String, title: String, content: String) {
        customTableViewTitle.text = title
        
        customTableViewContent.text = content
        
        customTableViewImage.image = UIImage(named: image)
    }

   
}
