//
//  LoginView.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var RegisterModel : RegisterViewModel
    @State var eyehidden = true
    var body: some View {
        VStack {
            Spacer()
            TextFields.CustomTextField(text: $RegisterModel.textEmail , placeHolder: "Mailinizi giriniz!")
            TextFields.SecureCustomField(text: $RegisterModel.textPassword , placeHolder: "Şifre oluşturunuz!", hidden: $eyehidden)
            
            HStack{
                Button(action: {
                    
                }) {
                    Text("Giriş Yap").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                }

                Button(action: {
                    
                }) {
                    Text("Kayıt Ol").frame(width: 100, height: 50).background(Color.black).foregroundStyle(Color.white).clipShape(.rect(cornerRadius: 10))
                }
            }.padding(.top, 30)
            Spacer()
        }.background(BackGround())
    }
}

#Preview {
    LoginView(RegisterModel: RegisterViewModel())
}
