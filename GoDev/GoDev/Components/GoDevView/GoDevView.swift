//
//  GoDevView.swift
//  GoDev
//
//  Created by Idwall Go Dev 001 on 29/03/22.
//

import UIKit

public class GoDevView: UIView {
    
    lazy var textInfo: UILabel = {
        let label = UILabel()

        label.text = "Center"
        
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    public init(bg: UIColor?) {
        super.init(frame: .zero)
        
        self.backgroundColor = bg ?? .orange
        self.layer.borderWidth = 5.0
        self.layer.cornerRadius = 16
        self.layer.borderColor = bg?.cgColor ?? UIColor.orange.cgColor
        
        config()
    }
    
    private func config() {
        addSubview(textInfo)
        
        NSLayoutConstraint.activate([
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
