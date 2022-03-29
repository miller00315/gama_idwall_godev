//
//  GoDevButton.swift
//  GoDev
//
//  Created by Idwall Go Dev 001 on 29/03/22.
//

import UIKit

public class GoDevButton: UIButton {
    
    private var config: Config {
        didSet {
            updateDisplay()
        }
    }
    
    public init(config: Config) {
        self.config = config
        super.init(frame: .zero)
        
        configure()
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: 140, height: 45)
    }
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut]) {
                self.backgroundColor = self.isHighlighted ? self.config.highlighted : self.config.backgroundColor
                
                self.applyShadow(shadow: self.isHighlighted ? .pressed() : .standard())
                
                self.transform = self.isHighlighted ? .init(translationX: 0, y: 1) : .identity
                
            } completion: { _ in
                
            }

        }
    }
    
    required init?(coder: NSCoder) {
        self.config = .light()
        
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        applyShadow(shadow: Shadow.standard())
        updateDisplay()
    }
    
    private func updateDisplay() {
        backgroundColor = config.backgroundColor
        setTitleColor(config.foregroundColor, for: .normal)
    }
    
    
    private func applyShadow(shadow: Shadow) {
        layer.shadowColor = shadow.color.cgColor
        layer.shadowOffset = shadow.offset
        layer.cornerRadius = shadow.radius
        layer.shadowOpacity = shadow.opacity
    }
}

public extension GoDevButton {
    
    struct Config {
        
        public let backgroundColor: UIColor
        public let highlighted: UIColor
        public let foregroundColor: UIColor
        
        public static func light() -> Config {
            Config(backgroundColor: .white,
                   highlighted: .systemGray,
                   foregroundColor: .systemGray)
        }
        
        public static func dark() -> Config {
            Config(backgroundColor: .black,
                   highlighted: .red,
                   foregroundColor: .white)
        }
    }
    
    struct Shadow {
        public let offset: CGSize
        public let radius: CGFloat
        public let color: UIColor
        public let opacity: Float
        
        public static func standard() -> Shadow {
            Shadow(offset: .init(width: 0, height: 2),
                   radius: 3,
                   color: .systemGray,
                   opacity: 0.2)
        }
        
        public static func pressed() -> Shadow {
            Shadow(offset: .init(width: 0, height: 1),
                   radius: 1,
                   color: .systemRed,
                   opacity: 0.2)
        }
    }
}
