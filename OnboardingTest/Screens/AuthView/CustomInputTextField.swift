//
//  CustomInputTextField.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import UIKit

class CustomInputTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = .preferredFont(forTextStyle: .title1)
        adjustsFontSizeToFitWidth = true
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}


