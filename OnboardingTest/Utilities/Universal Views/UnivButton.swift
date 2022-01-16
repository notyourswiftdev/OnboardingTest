//
//  UnivButton.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import UIKit

class UnivButton: UIButton {
    
    init(title: String, titleColor: UIColor, font: UIFont, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.configure(title: title, titleColor: titleColor, font: font, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(title: String, titleColor: UIColor, font: UIFont, backgroundColor: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
}
