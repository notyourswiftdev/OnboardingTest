//
//  HomeViewController.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import UIKit

class HomeViewController: UIViewController {
    typealias Home = HomeViewController
    
    static let SIGNOUT: String = "Signout"
    static let PASSWORD: String = "Change Password"
    
    let profileTableView = UITableView()
    let profileTableArray = [Home.PASSWORD, Home.SIGNOUT]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureProfileTableView()
        constraints()
    }
    
    private func configureProfileTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
    
    @objc func signoutButtonAction() {
        UserManager.shared.signoutUser { error in
            if let error = error {
                print(error)
            }
        }
    }
}

// MARK: - UITableView Extension -
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileTableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.text
        return cell
    }
    
    
}

// MARK: - Constraints Extension -
extension HomeViewController {
    private func constraints() {
        
    }
}
