//
//  GameView.swift
//  SudokuApp
//
//  Created by yusuf on 12.03.2024.
//

import SwiftUI

struct GameView: View {
    @State private var totalScore: Int = UserDataManager.shared.getTotalScore()
    @ObservedObject var viewModel = SudokuViewModel()
    @State var isStart = false
    
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
                
                NavigationLink(destination: ContentView(), isActive: $isStart) {
                    Button(action: {
                        self.isStart = true
                        self.viewModel.startGame() // Oyunu başlat ve zamanı kaydet
                    }) {
                        Text("Başlat").font(.title2)
                            .fontDesign(.rounded)
                            .frame(width: 150, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Spacer()
            }.background(BackGround2())
            
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    GameView()
}
