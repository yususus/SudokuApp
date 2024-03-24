//
//  BackGround3.swift
//  SudokuApp
//
//  Created by yusuf on 24.03.2024.
//

import SwiftUI

struct BackGround3: View {
    var body: some View {
        VStack {
                ZStack {
                        VStack {
                            Text("1").rotationEffect(.degrees(-30)).font(.custom("", size: 70)).padding().foregroundStyle(Color.teal)
                        }.frame(width: 400, height: 250,alignment: .topTrailing).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("2").rotationEffect(.degrees(10)).font(.custom("", size: 70)).padding().foregroundStyle(Color.green)
                        }.frame(width: 400, height: 250,alignment: .bottom).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("3").rotationEffect(.degrees(300)).font(.custom("", size: 70)).foregroundStyle(Color.orange)
                                .padding()
                        }.frame(width: 400, height: 300,alignment: .topLeading).blur(radius: 3)
                    VStack {
                        Text("8").rotationEffect(.degrees(30)).font(.custom("", size: 70)).padding().foregroundStyle(Color.red)
                    }.frame(width: 400, height: 250,alignment: .bottomTrailing).blur(radius: 3)
                    Spacer()
                    VStack {
                        Text("7").rotationEffect(.degrees(30)).font(.custom("", size: 70)).foregroundStyle(Color.yellow)
                            .padding()
                    }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                     
                }.frame(height: 250)
                
                ZStack {
                    
                        VStack {
                            Text("4").rotationEffect(.degrees(90)).font(.custom("", size: 70)).padding().foregroundStyle(Color.purple)
                        }.frame(width: 400, height: 300,alignment: .topLeading).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("5").rotationEffect(.degrees(75)).font(.custom("", size: 70)).padding().foregroundStyle(Color.brown)
                        }.frame(width: 400, height: 300,alignment: .trailing).blur(radius: 3)
                        Spacer()
                    VStack {
                        Text("3").rotationEffect(.degrees(250)).font(.custom("", size: 70)).padding().foregroundStyle(Color.orange)
                        }.frame(width: 400, height: 250,alignment: .center).blur(radius: 3)
                        VStack {
                            Text("6").rotationEffect(.degrees(220)).font(.custom("", size: 70)).padding().foregroundStyle(Color.indigo)
                        }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                    
                }.frame(height: 250)
                
            ZStack {
                
                    VStack {
                        Text("7").rotationEffect(.degrees(90)).font(.custom("", size: 70)).padding().foregroundStyle(Color.mint)
                    }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                    Spacer()
                    VStack {
                        Text("8").rotationEffect(.degrees(75)).font(.custom("", size: 70)).padding().foregroundStyle(Color.yellow)
                    }.frame(width: 400, height: 300,alignment: .trailing).blur(radius: 3)
                    Spacer()
                VStack {
                    Text("5").rotationEffect(.degrees(20)).font(.custom("", size: 70)).padding().foregroundStyle(Color.purple)
                }.frame(width: 400, height: 250,alignment: .bottom).blur(radius: 3)
                VStack {
                    Text("1").rotationEffect(.degrees(250)).font(.custom("", size: 70)).padding().foregroundStyle(Color.green)
                }.frame(width: 400, height: 250,alignment: .topLeading).blur(radius: 3)
                    VStack {
                        Text("9").rotationEffect(.degrees(220)).font(.custom("", size: 70)).padding().foregroundStyle(Color.red)
                    }.frame(width: 400, height: 300,alignment: .top).blur(radius: 3)
                
            }.frame(height: 250)
                
            
        }.background(Color.cyan.opacity(0.4))
        
    }
}
#Preview {
    BackGround3()
}
