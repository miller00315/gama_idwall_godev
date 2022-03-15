//
//  ItemCollectionViewCell.swift
//  aula05_exercicio
//
//  Created by Idwall Go Dev 001 on 15/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    static let identifier = "ItemCollectionViewCell"
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(image: String) {
        if let image = UIImage(named: image) {
            imageLogo.image = image
        }
    }
}
