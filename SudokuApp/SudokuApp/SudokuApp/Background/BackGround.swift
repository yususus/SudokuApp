//
//  BackGround.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import SwiftUI

struct BackGround: View {
    var body: some View {
        VStack{
            ZStack {
                VStack {
                    Text("").frame(width: 175, height: 175).background(Color.yellow).clipShape(.rect(cornerRadius: 25))
                }.frame(width: 500, height: 300,alignment: .bottomLeading).blur(radius: 5)
                Spacer()
                VStack {
                    Text("").frame(width: 200, height: 200).background(Color.orange).clipShape(.rect(cornerRadius: 25)).blur(radius: 5)
                }.frame(width: 500, height: 300,alignment: .topTrailing)
            }.frame(width: 500, height: 300)
            
            
            ZStack {
                VStack {
                    Text("").frame(width: 175, height: 175).background(Color.orange).clipShape(.rect(cornerRadius: 25))
                }.frame(width: 500, height: 300,alignment: .bottomLeading).blur(radius: 5)
                VStack {
                    Text("").frame(width: 100, height: 100).background(Color.red).clipShape(.rect(cornerRadius: 25)).blur(radius: 5)
                }.frame(width: 400, height: 300,alignment: .topLeading)
                Spacer()
                VStack {
                    Text("").frame(width: 200, height: 200).background(Color.yellow).clipShape(.rect(cornerRadius: 25)).blur(radius: 5)
                }.frame(width: 500, height: 300,alignment: .topTrailing)
                VStack {
                    Text("").frame(width: 100, height: 100).background(Color.red).clipShape(.rect(cornerRadius: 25)).blur(radius: 5)
                }.frame(width: 400, height: 300,alignment: .bottomTrailing)
            }.frame(width: 500, height: 300)
            
            Spacer()
        }.background(Color.blue.opacity(0.4))
    }
}

#Preview {
    BackGround()
}
