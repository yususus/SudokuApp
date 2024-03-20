//
//  ContentView.swift
//  SudokuApp
//
//  Created by yusuf on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SudokuViewModel()
    let selectableNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var remainingSeconds = 10
    @State private var isGameFinished = false
    
    var body: some View {
            VStack() {
                HStack {
                    Text("Kalan Süre:")
                    Text("\(remainingSeconds)")
                        .foregroundColor(remainingSeconds <= 10 ? .red : .black)
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                Spacer()
                VStack(spacing: 0) {
                    ForEach(0..<9) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<9) { column in
                                Button(action: {
                                    // Tıklanan hücrenin konumunu güncelle
                                    viewModel.selectedRow = row
                                    viewModel.selectedColumn = column
                                }) {
                                    Text("\(viewModel.sudokuModel.cells[row][column])")
                                        .foregroundStyle(Color.black)
                                        .frame(width: 35, height: 35)
                                        .background(self.backgroundColorForRow(row, column))
                                        .border(Color.black)
                                        .onTapGesture {
                                            viewModel.selectedRow = row
                                            viewModel.selectedColumn = column
                                        }
                                }
                            }
                        }
                    }
                }
                Spacer()
                VStack {
                    ForEach(0..<3) { rowIndex in
                        HStack {
                            ForEach(1..<4) { columnIndex in
                                let number = rowIndex * 3 + columnIndex
                                Button(action: {
                                    // Seçilen sayıyı tahtaya yerleştir
                                    viewModel.placeNumber(number: number)
                                }) {
                                    Text("\(number)")
                                        .foregroundStyle(Color.white)
                                        .frame(width: 35, height: 35)
                                        .background(Color.blue)
                                        .clipShape(.rect(cornerRadius: 10))
                                }
                            }
                        }
                    }
                    Button(action: {
                        viewModel.resetCell()
                    }) {
                        Text("Reset")
                            .foregroundStyle(Color.white)
                            .frame(width: 70, height: 35)
                            .background(Color.red)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
                .padding(.top, 10)
                NavigationLink(destination: GameView(), isActive: $isGameFinished) {
                           EmptyView()
                       }
            }
            .padding()
            .onAppear {
                // Oyun başladığında hücrelerin ilk değerlerini sakla
                viewModel.startGame()
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
            .onReceive(timer) { _ in
                if remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else {
                    // Zaman dolduğunda oyunu bitir
                    isGameFinished = true
                    timer.upstream.connect().cancel()
                }
            }
        }
    
    
    private func backgroundColorForRow(_ row: Int, _ column: Int) -> Color {
        let boxRow = row / 3
        let boxColumn = column / 3
        return (boxRow + boxColumn) % 2 == 0 ? Color.cyan.opacity(0.5) : Color.white // 3x3'lük kutuların arka plan rengi
    }
}





#Preview {
    ContentView()
}
