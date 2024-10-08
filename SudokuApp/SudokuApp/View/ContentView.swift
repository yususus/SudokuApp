//
//  ContentView.swift
//  SudokuApp
//
//  Created by yusuf on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SudokuViewModel()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var remainingSeconds = 0
    @State private var isGameFinished = false
   
    var selectedDifficulty: SudokuViewModel.Difficulty // GameView'dan alınan zorluk seviyesi

    
    var body: some View {
        VStack {
            HStack {
                Text("\(timeString(remainingSeconds))")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(remainingSeconds >= 1800 ? .red : .black)
            }
            .frame(width: 150)
            .padding()
            .background(Color.teal.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
            
            Spacer()
            
            VStack(spacing: 0) {
                ForEach(0..<9) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<9) { column in
                            Button(action: {
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
                                viewModel.placeNumber(number: number)
                            }) {
                                Text("\(number)")
                                    .foregroundStyle(Color.white)
                                    .frame(width: 35, height: 35)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.top, 10)
            
            NavigationLink(destination: GameView(), isActive: $isGameFinished) {
                EmptyView()
            }
        }
        .padding()
        .onAppear {
            startGame(with: selectedDifficulty)
        }
        .onReceive(timer) { _ in
            remainingSeconds += 1
        }
        .alert(isPresented: $viewModel.isGameFinished) {
            Alert(
                title: Text("Tebrikler!"),
                message: Text("Oyunu başarıyla tamamladınız."),
                dismissButton: .default(Text("Tamam"), action: {
                    viewModel.isGameFinished = false // Reset ViewModel flag
                    isGameFinished = true // Update for NavigationLink
                })
            )
        }
    }
    
    private func startGame(with difficulty: SudokuViewModel.Difficulty) {
            viewModel.startGame(difficulty: difficulty)
            remainingSeconds = 0
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
    
    private func timeString(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func backgroundColorForRow(_ row: Int, _ column: Int) -> Color {
        if viewModel.selectedRow == row && viewModel.selectedColumn == column {
            return Color.yellow.opacity(1)
        }
        
        if row == viewModel.selectedRow || column == viewModel.selectedColumn {
            return Color.yellow.opacity(0.4)
        }
        
        let boxRow = row / 3
        let boxColumn = column / 3
        return (boxRow + boxColumn) % 2 == 0 ? Color.cyan.opacity(0.5) : Color.white
    }
}



#Preview {
    ContentView(selectedDifficulty: .medium)
}
