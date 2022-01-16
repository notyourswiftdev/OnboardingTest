//
//  UserManager.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import Foundation
import FirebaseAuth

class UserManager {
    
    typealias CompleteVoid = (Result<Void,Error>) -> Void
    
    // MARK: - Singleton -
    static let shared = UserManager()
    
    func registerUser(email: String, password: String, completion: @escaping CompleteVoid) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self,
                  let user = authResult?.user,
                  let email = user.email else {
                      let error = error != nil ? error! : NSError(domain: "\(#function)", code: 999)
                      completion(.failure(error))
                      return
                  }
            completion(.success(Void()))
            self.saveUser(userId: user.uid, email: email)
        }
    }
    
    func signoutUser(completion: (Error?) -> Void = { _ in }) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let signoutError {
            print("Error signing out: \(signoutError)")
            completion(signoutError)
        }
    }
    
    // MARK: - Private Methods -
    private func saveUser(userId: String, email: String) {
        FirebaseManager.saveData(toLocation: userId, withData: ["email": email]) { error, _ in
            if let error = error {
                NSLog(error.localizedDescription, #function)
            }
        }
    }
}
