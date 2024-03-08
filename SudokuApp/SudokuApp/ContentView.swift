//
//  ContentView.swift
//  SudokuApp
//
//  Created by yusuf on 6.03.2024.
//

import SwiftUI
struct SudokuBoard {
    var cells: [[Int]]
    
    init() {
        // Sudoku tahtasını başlatmak için varsayılan değerlerle bir dizi oluşturun
        cells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    }
}

struct ContentView: View {
    @State private var sudokuBoard = SudokuBoard()
    @State private var selectedRow = -1
    @State private var selectedColumn = -1
    let selectableNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<9) { row in
                HStack(spacing: 0) {
                    ForEach(0..<9) { column in
                        Button(action: {
                            // Tıklanan hücrenin konumunu güncelle
                            self.selectedRow = row
                            self.selectedColumn = column
                        }) {
                            Text("\(self.sudokuBoard.cells[row][column])")
                                .foregroundStyle(Color.black)
                                .frame(width: 30, height: 30)
                                .border(Color.black)
                        }
                    }
                }
            }
            
            // Seçilebilir sayıları gösteren bir satır
            HStack(spacing: 5) {
                ForEach(selectableNumbers, id: \.self) { number in
                    Button(action: {
                        // Seçilen sayıyı tahtaya yerleştir
                        if self.selectedRow != -1 && self.selectedColumn != -1 {
                            self.sudokuBoard.cells[self.selectedRow][self.selectedColumn] = number
                        }
                    }) {
                        Text("\(number)")
                            .foregroundStyle(Color.black)
                            .frame(width: 35, height: 35)
                            .background(Color.blue)
                            .border(Color.black)
                            
                    }
                }
            }
            .padding(.top, 10)
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
