//
//  SudokuModel.swift
//  SudokuApp
//
//  Created by yusuf on 12.03.2024.
//

import SwiftUI
import Foundation

struct SudokuModel {
    var cells: [[Int]]
    var initialCells: [[Int]] // Yeni eklenen değişken
    
    init() {
            cells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
            initialCells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
            initializeRandomNumbers() // Rastgele sayıları başlangıçta yerleştir
        }
    
    mutating func isValidMove(row: Int, column: Int, value: Int) -> Bool {
        // Aynı satırda, sütunda veya 3x3'lük kutuda aynı rakamın tekrar kullanılmadığından emin ol
        return isUniqueInRow(row, value) && isUniqueInColumn(column, value) && isUniqueInBox(row, column, value)
    }
    
    private func isUniqueInRow(_ row: Int, _ value: Int) -> Bool {
        return !cells[row].contains(value)
    }
    
    private func isUniqueInColumn(_ column: Int, _ value: Int) -> Bool {
        let columnValues = cells.map { $0[column] }
        return !columnValues.contains(value)
    }
    
    private func isUniqueInBox(_ row: Int, _ column: Int, _ value: Int) -> Bool {
        let boxRowStart = row - row % 3
        let boxColumnStart = column - column % 3
        
        for i in boxRowStart..<(boxRowStart + 3) {
            for j in boxColumnStart..<(boxColumnStart + 3) {
                if cells[i][j] == value {
                    return false
                }
            }
        }
        
        return true
    }
    mutating func initializeRandomNumbers() {
        // Sudoku oyununda rastgele sayılarla doldurulmuş bir başlangıç durumu oluştur
        for _ in 0..<20 { // Bu sayıyı isteğe göre değiştirebilirsin, daha az veya daha çok sayıda hücreyi başlangıçta doldurmak için
            let randomRow = Int.random(in: 0..<9)
            let randomColumn = Int.random(in: 0..<9)
            let randomValue = Int.random(in: 1...9) // 0 olmamalı, Sudoku'da rakamlar 1 ila 9 arasında
            
            // Eğer bu hücre boşsa ve rastgele seçilen sayı bu hücreye uyar, o zaman yerleştir
            if cells[randomRow][randomColumn] == 0 && isValidMove(row: randomRow, column: randomColumn, value: randomValue) {
                            cells[randomRow][randomColumn] = randomValue
                initialCells[randomRow][randomColumn] = randomValue // Başlangıç durumunu kaydet
                        }
        }
    }
    
    mutating func makeMove(row: Int, column: Int, value: Int) {
        // Yalnızca değiştirilebilir hücrelerin değerlerini değiştirin
        if initialCells[row][column] == 0 {
            cells[row][column] = value
        }
    }
    mutating func setValue(row: Int, column: Int, value: Int) {
        if initialCells[row][column] == 0 {
            cells[row][column] = value
        }
    }
    
    func isComplete() -> Bool {
        for row in cells {
            if row.contains(0) {
                return false
            }
        }
        return true
    }
}

