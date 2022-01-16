//
//  FirebaseManager.swift
//  OnboardingTest
//
//  Created by Aaron Cleveland on 1/15/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FirebaseManager {
    
    static func saveData(toLocation: String, withData: [String: Encodable], completion: @escaping (Error?, DatabaseReference) -> Void) {
        Database.database().reference().child("users").child(toLocation).setValue(withData, withCompletionBlock: completion)
    }
}
