//
//  SignupViewController.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import Foundation
import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    lazy var emailTextField = CustomInputTextField()
    lazy var passwordTextField = CustomInputTextField()
    lazy var signupButton = UnivButton(title: "Signup", titleColor: .darkGray, font: .systemFont(ofSize: 28), backgroundColor: .tertiarySystemBackground)
    lazy var verticalStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signupButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        verticalStackView.spacing = 16
        verticalStackView.axis = .vertical
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        configureUI()
        configureConstraints()
    }
    
    // MARK: - Private Helpers -
    private func configureUI() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        signupButton.addTarget(self, action: #selector(signupButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions -
    @objc func signupButtonAction() {
        print("Signup Tested")
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        UserManager.shared.registerUser(email: email, password: password) { result in
            switch result {
            case .success():
                let vc = HomeViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - SignupViewController Constraints -
extension SignupViewController {
    private func configureConstraints() {
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
}
