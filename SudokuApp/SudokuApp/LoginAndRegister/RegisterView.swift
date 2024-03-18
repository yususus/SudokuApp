//
//  RegisterView.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import SwiftUI

struct RegisterView: View {
    @State var eyehidden = true
    @StateObject var registerViewModel = RegisterViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Const.CustomTextField(text: $registerViewModel.textEmail , placeHolder: "Mailinizi giriniz!")
                Const.CustomTextField2(text: $registerViewModel.textUserName , placeHolder: "Kullanıcı adı giriniz!")
                Const.SecureCustomField(text: $registerViewModel.textPassword , placeHolder: "Şifre oluşturunuz!", hidden: $eyehidden)
                
                HStack{
                    Button(action: {
                        registerViewModel.registerUser()
                    }) {
                        Text("Kayıt Ol").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                    }
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Giriş Yap").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                    }
                    
                }.padding(.top, 30)
                if registerViewModel.isRegistering {
                    ZStack {
                        ProgressView()
                    }
                }
                Spacer()
            }.background(BackGround())
                
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    RegisterView()
}
