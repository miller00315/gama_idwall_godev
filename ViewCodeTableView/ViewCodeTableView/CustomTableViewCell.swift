//
//  CustomTableViewCell.swift
//  ViewCodeTableView
//
//  Created by Idwall Go Dev 001 on 24/03/22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(systemName: "house")
        
        image.contentMode = .scaleAspectFit
        
        image.tintColor = .blue
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        
        stack.spacing = 10
        
        stack.contentMode = .top
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    lazy var titlteLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Lorem ipsum is simply dummy"
        
        label.textColor = .systemGray
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Deescription meos sendo dificil de pensar em todas a spossibilidades existentes em um único ser"
        
        label.numberOfLines = 0
        
        label.textColor = .lightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        stackView.addArrangedSubview(titlteLabel)
        
        stackView.addArrangedSubview(descriptionLabel)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
