//
//  LoginView.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM = LoginViewModel()
    @State var eyehidden = true
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Const.CustomTextField(text: $loginVM.email , placeHolder: "Mailinizi giriniz!")
                Const.SecureCustomField(text: $loginVM.password , placeHolder: "Şifre giriniz!", hidden: $eyehidden)
                
                HStack{
                    Button(action: {
                        loginVM.loginUser()
                    }) {
                        Text("Giriş Yap").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                    }
                    
                    NavigationLink(destination: GameView(), isActive: $loginVM.isLoggingIn) {
                        EmptyView()
                    }.hidden()
                    
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Kayıt Ol").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                    }
                }.padding(.top, 30)
                Spacer()
            }.background(BackGround())
                
        }
        .navigationBarBackButtonHidden()
        .alert(isPresented: $loginVM.showAlert) {
            Alert(title: Text(loginVM.alertTitle), message: Text(loginVM.alertMessage), dismissButton: .default(Text("Tamam")))
        }
    }
}



#Preview {
    LoginView()
}
