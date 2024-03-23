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
    @State private var remainingSeconds = 200
    @State private var isGameFinished = false
    
    var body: some View {
        VStack() {
            HStack {
                Text("Kalan Süre:").font(.title3)
                Text("\(remainingSeconds)").fontWeight(.bold).font(.title3)
                    .foregroundColor(remainingSeconds <= 10 ? .red : .black)
            }
            .frame(width: 150)
            .padding()
            .background(Color.teal.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10, style: .circular))
            Spacer()
            VStack(spacing: 0) {
                ForEach(0..<9) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<9) { column in
                            Button(action: {
                                // Tıklanan hücrenin konumunu güncelle
                                viewModel.selectCell(row: row, column: column)
                                
                            }) {
                                Text(viewModel.sudokuModel.cells[row][column] != 0 ? "\(viewModel.sudokuModel.cells[row][column])" : " ")
                                    .fontWeight(viewModel.initialCells[row][column] != 0 ? .semibold : .regular)
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
                            }.disabled(remainingSeconds == 0)
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
            viewModel.startGame()
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        .onReceive(timer) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                // Zaman dolduğunda oyunu bitir
                
                viewModel.isGameFinished = true
                viewModel.isTimeEnd = true
                timer.upstream.connect().cancel()
            }
        }
        .alert(isPresented: $viewModel.isGameFinished) {
            if viewModel.isTimeEnd {
                // Time's up alert
                return Alert(
                    title: Text("Zaman Doldu!"),
                    message: Text("Oyunu tamamlayamadınız."),
                    dismissButton: .default(Text("Tamam"), action: {
                        viewModel.isGameFinished = false
                        isGameFinished = true // Update for NavigationLink
                    }))
            } else {
                // Game completion alert (use the same logic as before)
                return Alert(
                    title: Text("Tebrikler!"),
                    message: Text("Oyunu başarıyla tamamladınız."),
                    dismissButton: .default(Text("Tamam"), action: {
                        viewModel.isGameFinished = false // Reset ViewModel flag
                        isGameFinished = true // Update for NavigationLink
                    }))
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
