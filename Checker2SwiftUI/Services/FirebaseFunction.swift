//
//  FirebaseFunction.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 23.04.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth


func signInWithEmail(email: String, password: String, completion: @escaping (Bool, String) -> ()) {
    
    Auth.auth().signIn(withEmail: email, password: password) { res, error in
        
        if error != nil {
            completion(false, (error?.localizedDescription)!)
            return
        }
        
        completion(true, (res?.user.email)!)
    }
}

func signUpWithEmail(email: String, password: String, completion: @escaping (Bool, String) -> ()) {
    
    Auth.auth().createUser(withEmail: email, password: password) { res, error in
        
        if error != nil {
            completion(false, (error?.localizedDescription)!)
            return
        }
        
        completion(true, (res?.user.email)!)
    }
}
