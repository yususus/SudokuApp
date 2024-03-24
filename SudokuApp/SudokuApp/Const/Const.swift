//
//  Const.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import Foundation
import SwiftUI

class Const{
    static let alertMessage: String = "Oyun süresi bitti."
    @ViewBuilder
    static func PointsText(minutes: String, point: String) -> some View{
        Text("\(minutes) dakika içinde bitirirseniz \(point) puan").fontWeight(.bold)
    }
    
    
    
    /*
    @ViewBuilder
    static func CustomTextField(text : Binding<String>, placeHolder : String)->  some View {
        HStack(alignment: .center) {
            Image(systemName: "envelope").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 25,maxHeight: 25)
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.black.opacity(0.8))
                }
                TextField("", text: text)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 350, height: 40)
        .padding(.horizontal, 10)
        .background(Color.white).opacity(0.95)
        .shadow(color: .black, radius: 100)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        
    }
    @ViewBuilder
    static func CustomTextField2(text : Binding<String>, placeHolder : String)->  some View {
        HStack(alignment: .center) {
            Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 25,maxHeight: 25)
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.black.opacity(0.8))
                }
                TextField("", text: text)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 350, height: 40)
        .padding(.horizontal, 10)
        .background(Color.white).opacity(0.95)
        .shadow(color: .black, radius: 100)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        
    }
    @ViewBuilder
    static func SecureCustomField(text : Binding<String>, placeHolder : String, hidden: Binding<Bool>)->  some View {
        HStack(alignment: .center) {
            Image(systemName: "key.fill").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 25,maxHeight: 25)
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.black.opacity(0.8))
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
        .background(Color.white).opacity(0.95)
        .shadow(color: .black, radius: 100)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        
    }
     */
}
