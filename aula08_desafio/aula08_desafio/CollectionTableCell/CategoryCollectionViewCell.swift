//
//  CategoryCollectionViewCell.swift
//  aula08_desafio
//
//  Created by Idwall Go Dev 001 on 16/03/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: String, label: String) {
        
        if let image = UIImage(named: image) {
            categoryImageView.image = image
        }
        
        categoryLabel.text = label
    }

}
