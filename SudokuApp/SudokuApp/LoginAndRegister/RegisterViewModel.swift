//
//  RegisterViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class RegisterViewModel : ObservableObject{
    @Published var textEmail = ""
    @Published var textPassword = ""
    @Published var textUserName = ""
    
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    @Published var isRegistering = false
    @Published var registrationError: Error? = nil
    
    func registerUser() {
        isRegistering = true
        registrationError = nil
        
        Auth.auth().createUser(withEmail: textEmail, password: textPassword) { result, error in
            if let error = error {
                self.registrationError = error
                return
            }
            
            guard let user = result?.user else {
                // Handle unexpected issue
                return
            }
            
            // Save user data to Firestore
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData([
                "email": self.textEmail,
                "username": self.textUserName,
                // Add other fields as needed
            ]) { error in
                if let error = error {
                    print("Error saving user data:", error)
                } else {
                    print("User data saved successfully")
                    // Handle successful registration (e.g., navigate to another view)
                }
            }
            
            self.isRegistering = false
        }
    }
}
