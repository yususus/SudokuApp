//
//  RegisterViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import Foundation
import SwiftUI


class RegisterViewModel : ObservableObject{
    @Published var textEmail = ""
    @Published var textPassword = ""
    @Published var textUserName = ""
    
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    
    
    
}
