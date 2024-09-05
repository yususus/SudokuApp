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
    @State var navigateToContentView = false
    @State private var selectedDifficulty: SudokuViewModel.Difficulty = .medium // Varsayılan zorluk seviyesi

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
                                .resizable().frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        }
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
                            
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .shadow(color: .black.opacity(0.8), radius: 4, x: 3, y: 3) // Gölge efekti
                            .padding()
                            
                            
                            .padding()

                        Spacer()

                        HStack {
                            
                            SelectDiffuclty(title: "Easy", color: .green, difficulty: .easy, selectedDifficulty: $selectedDifficulty, navigateToContentView: $navigateToContentView
                            )
                            
                            SelectDiffuclty(title: "Medium", color: .orange, difficulty: .medium, selectedDifficulty: $selectedDifficulty, navigateToContentView: $navigateToContentView
                            )
                            SelectDiffuclty(title: "Hard", color: .red, difficulty: .hard, selectedDifficulty: $selectedDifficulty, navigateToContentView: $navigateToContentView
                            )
                            
                        }

                        Spacer()
                    }
                }
                .background(BackGround3())
                .navigationDestination(isPresented: $navigateToContentView) {
                    ContentView(selectedDifficulty: selectedDifficulty) // Zorluk seviyesini contentView ekranına aktarır
                }
            }
            .navigationBarBackButtonHidden()

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
