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
    @State var details = false
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack {
                        Text("Total Point: \(totalScore)")
                            .padding()
                        Button(action: {
                            self.details.toggle()
                        }) {
                            Image(systemName: "info.circle.fill")
                                .resizable().frame(width: 25,height: 25)
                                .foregroundColor(.black)
                        }
                        //info button contents
                        .contextMenu {
                            VStack {
                                Const.PointsText(minutes: "5", point: "1000")
                                Const.PointsText(minutes: "10", point: "750")
                                Const.PointsText(minutes: "15", point: "500")
                                Const.PointsText(minutes: "20", point: "250")
                                Const.PointsText(minutes: "25", point: "100")
                                Const.PointsText(minutes: "30", point: "50")
                                
                            }
                        }
                        
                    }
                    
                    VStack {
                        Spacer()
                        Text("SUDOKU TIME")
                            .foregroundStyle(Color.black).fontWeight(.semibold).font(.largeTitle).fontDesign(.rounded)
                            .frame(width: 300, height: 100)
                        Spacer()
                        
                        NavigationLink(destination: ContentView(), isActive: $isStart) {
                            Button(action: {
                                self.isLoading = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.isStart = true
                                    self.viewModel.startGame() // Oyunu başlat ve zamanı kaydet
                                    self.isLoading = false
                                }
                            }) {
                                Text("Start").font(.title2)
                                    .fontDesign(.rounded)
                                    .frame(width: 150, height: 50)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        
                        Spacer()
                    }
                    
                }.background(BackGround3())
                
            }.navigationBarBackButtonHidden()
            if isLoading {
                
                    Color(.systemBackground)
                        .ignoresSafeArea()
                        .opacity(0.8)
                        
                    SplashBackGround()
                
            }
        }
        
    }
}

#Preview {
    GameView()
}
