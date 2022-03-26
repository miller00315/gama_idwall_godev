//
//  CustomTableViewCell.swift
//  ExercicioWhatsClone
//
//  Created by Idwall Go Dev 001 on 26/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    // MARK: - UI components
    
    lazy var avatarImageView: UIImageView = {
        
        let imageView = UIImageView();
        
        imageView.contentMode = .scaleToFill
        
        imageView.image = UIImage(named: "person")
        
        imageView.layer.cornerRadius = 30
        
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    lazy var contenStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        stackView.spacing = 16
        
        stackView.contentMode = .top
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView;
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "test name"
        
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "test content"
        
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarImageView)
        addSubview(contenStackView)
        
        self.accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
                
        NSLayoutConstraint.activate([
            contenStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contenStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contenStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            contenStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        contenStackView.addArrangedSubview(nameLabel)
        
        contenStackView.addArrangedSubview(contentLabel)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - public methods

}
