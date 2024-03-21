//
//  GameView.swift
//  SudokuApp
//
//  Created by yusuf on 12.03.2024.
//

import SwiftUI

struct GameView: View {
    @State private var totalScore = UserDataManager.shared.getTotalScore()
    var body: some View {
        NavigationView {
            VStack {
                Text("Toplam Puan: \(totalScore)")
                                .padding()
                Spacer()
                Text("SUDOKU ZAMANI")
                    .foregroundStyle(Color.black).fontWeight(.semibold).font(.largeTitle).fontDesign(.rounded)
                    .frame(width: 300, height: 100)
                    
                Spacer()
                
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Kolay").font(.title2)
                        .fontDesign(.rounded)
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }

                NavigationLink {
                    ContentView()
                } label: {
                    Text("Orta").font(.title2)
                        .fontDesign(.rounded)
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }

                NavigationLink {
                    ContentView()
                } label: {
                    Text("Zor").font(.title2)
                        .fontDesign(.rounded)
                        .frame(width: 150, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }

                Spacer()
            }.background(BackGround2())
                
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    GameView()
}
