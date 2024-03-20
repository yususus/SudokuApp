//
//  SudokuViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 20.03.2024.
//

import Foundation

class SudokuViewModel: ObservableObject {
    @Published var sudokuModel = SudokuModel()
    @Published var initialCells: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var selectedRow = -1
    @Published var selectedColumn = -1
    @Published var isGameStarted = false // Oyunun başlayıp başlamadığını kontrol eder

    func startGame() {
        isGameStarted = true
        initialCells = sudokuModel.cells
    }

    func resetCell() {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            sudokuModel.cells[selectedRow][selectedColumn] = initialCells[selectedRow][selectedColumn]
        }
    }

    func placeNumber(number: Int) {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            if sudokuModel.isValidMove(row: selectedRow, column: selectedColumn, value: number) {
                sudokuModel.cells[selectedRow][selectedColumn] = number
            }
        }
    }
}
