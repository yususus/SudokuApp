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
    var initialCells: [[Int]]

    init() {
        cells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        initialCells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        fillBoard()
    }

    // Backtracking with solve sudoku
    private mutating func solve(row: Int = 0, column: Int = 0) -> Bool {
        var currentRow = row
        var currentColumn = column
        if currentColumn == cells[currentRow].count {
            currentColumn = 0
            currentRow += 1
            if currentRow == cells.count {
                return true // board full it succesfull
            }
        }
        if cells[currentRow][currentColumn] != 0 {
            return solve(row: currentRow, column: currentColumn + 1)
        }
        for value in 1...9 {
            if isValidMove(row: currentRow, column: currentColumn, value: value) {
                cells[currentRow][currentColumn] = value
                if solve(row: currentRow, column: currentColumn + 1) {
                    return true
                }
                cells[currentRow][currentColumn] = 0 // reverse
            }
        }
        return false // not solve
    }

    // random remove clues
    private mutating func removeClues(count: Int) {
        var cluesRemoved = 0
        while cluesRemoved < count {
            let randomRow = Int.random(in: 0..<9)
            let randomColumn = Int.random(in: 0..<9)
            if initialCells[randomRow][randomColumn] != 0 {
                cells[randomRow][randomColumn] = 0
                initialCells[randomRow][randomColumn] = 0
                cluesRemoved += 1
            }
        }
    }

    // fill the board and removeClues
    mutating func fillBoard() {
        if solve() {
            initialCells = cells
            removeClues(count: 60)
        } else {
            print("Bir çözüm bulunamadı.")
        }
    }

 
    mutating func isValidMove(row: Int, column: Int, value: Int) -> Bool {
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

    func isComplete() -> Bool {
        for row in cells {
            if row.contains(0) {
                return false
            }
        }
        return true
    }

    mutating func makeMove(row: Int, column: Int, value: Int) {
        if initialCells[row][column] == 0 {
            cells[row][column] = value
        }
    }


    mutating func setValue(row: Int, column: Int, value: Int) {
        if initialCells[row][column] == 0 {
            cells[row][column] = value
        }
    }
}

/*
 first try
mutating func initializeRandomNumbers() {
    var filledCells = 0
    while filledCells < 20 { // 20'den az hücre doldurulduysa döngüye devam et
        let randomRow = Int.random(in: 0..<9)
        let randomColumn = Int.random(in: 0..<9)
        let randomValue = Int.random(in: 1...9)

        if cells[randomRow][randomColumn] == 0 && isValidMove(row: randomRow, column: randomColumn, value: randomValue) {
            cells[randomRow][randomColumn] = randomValue
            initialCells[randomRow][randomColumn] = randomValue
            filledCells += 1 // Başarılı bir şekilde sayı yerleştirildiğinde sayacı artır
        }
    }
}
*/

/*
 second try
 
 mutating func initializeRandomNumbers() {
     var attempts = 0
     var filledCells = 0
     while filledCells < 20 && attempts < 100 { // 20 hücre doldurulana kadar veya 100 deneme yapıldığında dur
         let randomRow = Int.random(in: 0..<9)
         let randomColumn = Int.random(in: 0..<9)
         let randomValue = Int.random(in: 1...9)

         if cells[randomRow][randomColumn] == 0 && isValidMove(row: randomRow, column: randomColumn, value: randomValue) {
             cells[randomRow][randomColumn] = randomValue
             initialCells[randomRow][randomColumn] = randomValue
             filledCells += 1
         }
         attempts += 1
     }
 }

 */
/*
 original
 
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
 */
