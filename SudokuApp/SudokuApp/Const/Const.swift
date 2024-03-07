//
//  Const.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import Foundation
import SwiftUI

class TextFields{
    @ViewBuilder
    static func CustomTextField(text : Binding<String>, placeHolder : String)->  some View {
        HStack(alignment: .center) {
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.white.opacity(0.8))
                }
                TextField("", text: text)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 350, height: 40)
        .padding(.horizontal, 10)
        .background(Color.gray)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        
    }
    @ViewBuilder
    static func SecureCustomField(text : Binding<String>, placeHolder : String, hidden: Binding<Bool>)->  some View {
        HStack(alignment: .center) {
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.white.opacity(0.8))
                }
                if hidden.wrappedValue {
                    SecureField("", text: text)
                        .foregroundColor(.black)
                } else {
                    TextField("", text: text)
                        .foregroundColor(.black)
                }
            }
            Button(action: {
                hidden.wrappedValue.toggle()
            }) {
                Image(systemName: hidden.wrappedValue ? "eye.fill" : "eye.slash")
                    .foregroundColor(.black)
            }
        }
        .frame(width: 350, height: 40)
        .padding(.horizontal, 10)
        .background(Color.gray)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        
    }
}
