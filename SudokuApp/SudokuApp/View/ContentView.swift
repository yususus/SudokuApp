//
//  ContentView.swift
//  SudokuApp
//
//  Created by yusuf on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sudokuModel = SudokuModel() // SudokuModel'e değiştirildi
    @State private var selectedRow = -1
    @State private var selectedColumn = -1
    let selectableNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var body: some View {
        VStack() {
            TimerView()
            Spacer()
            VStack(spacing: 0) {
                ForEach(0..<9) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<9) { column in
                            Button(action: {
                                // Tıklanan hücrenin konumunu güncelle
                                self.selectedRow = row
                                self.selectedColumn = column
                            }) {
                                Text("\(self.sudokuModel.cells[row][column])")
                                    .foregroundStyle(Color.black)
                                    .frame(width: 35, height: 35)
                                    .background(self.backgroundColorForRow(row, column)) // Arka plan rengini belirle
                                    .border(Color.black)
                            }
                        }
                    }
                }
            }
            Spacer()
            // Seçilebilir sayıları gösteren bir satır
            HStack(spacing: 5) {
                ForEach(selectableNumbers, id: \.self) { number in
                    Button(action: {
                        // Seçilen sayıyı tahtaya yerleştir
                        if self.selectedRow != -1 && self.selectedColumn != -1 {
                            // Eğer hamle geçerliyse tahtaya yerleştir
                            if self.sudokuModel.isValidMove(row: self.selectedRow, column: self.selectedColumn, value: number) {
                                self.sudokuModel.cells[self.selectedRow][self.selectedColumn] = number
                            }
                        }
                    }) {
                        Text("\(number)")
                            .foregroundStyle(Color.white)
                            .frame(width: 35, height: 35)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
            }
            .padding(.top, 10)
        }.navigationBarBackButtonHidden()
        .padding()
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
