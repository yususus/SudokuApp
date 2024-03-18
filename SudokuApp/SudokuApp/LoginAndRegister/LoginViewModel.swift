//
//  LoginViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 18.03.2024.
//


import Foundation
import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  @Published var isLoggingIn = false
  @Published var loginError: Error? = nil
  @Published var showAlert = false // State to control alert presentation
  @Published var alertTitle = ""
  @Published var alertMessage = ""
  
  func loginUser() {
    loginError = nil
    showAlert = false // Reset alert state
    
    // Check if email and password are not empty
    if !email.isEmpty && !password.isEmpty {
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if let error = error {
          self.loginError = error
          self.showAlert = true // Show alert if login failed
            self.alertTitle = "Hata!!"
            self.alertMessage = "Giriş bilgileri uyuşmamakta."
          return
        }
        // Handle successful login (e.g., navigate to another view)
        print("Kullanıcı başarıyla giriş yaptı!")
        self.isLoggingIn = true
      }
    } else {
      showAlert = true // Show alert if fields are empty
        self.alertTitle = "Hata!!"
        self.alertMessage = "Bütün alanları doldurun lütfen!"
    }
  }
}

