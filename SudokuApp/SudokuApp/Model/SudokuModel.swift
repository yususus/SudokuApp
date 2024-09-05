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
        let values = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffled()
        for value in values {
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
    mutating func fillBoard(cluesToRemove: Int) {
        if solve() {
            initialCells = cells
            removeClues(count: cluesToRemove)
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
 
 private var board: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
     
     mutating func generate() -> [[Int]]? {
         clearBoard()
         return fillBoard() ? board : nil
     }
     
     private mutating func clearBoard() {
         board = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
     }
     
     private mutating func fillBoard() -> Bool {
         return fillCell(row: 0, column: 0)
     }
     
     private mutating func fillCell(row: Int, column: Int) -> Bool {
         var currentRow = row
         var currentColumn = column
         
         // If we reached the end of the board, return true to indicate success
         if currentRow == 9 {
             return true
         }
         
         // Move to the next row if we reached the end of the current row
         if currentColumn == 9 {
             currentRow += 1
             currentColumn = 0
             return fillCell(row: currentRow, column: currentColumn)
         }
         
         // Generate random permutation of numbers from 1 to 9
         var numbers = Array(1...9)
         numbers.shuffle()
         
         // Try filling the cell with each number in the permutation
         for number in numbers {
             if isValidMove(row: currentRow, column: currentColumn, value: number) {
                 board[currentRow][currentColumn] = number
                 if fillCell(row: currentRow, column: currentColumn + 1) {
                     return true
                 }
                 // If filling the cell with this number didn't lead to a solution, backtrack
                 board[currentRow][currentColumn] = 0
             }
         }
         
         return false
     }
     
     private func isValidMove(row: Int, column: Int, value: Int) -> Bool {
         // Check if the value is already present in the row or column
         for i in 0..<9 {
             if board[row][i] == value || board[i][column] == value {
                 return false
             }
         }
         
         // Check if the value is already present in the 3x3 subgrid
         let startRow = row - row % 3
         let startColumn = column - column % 3
         for i in startRow..<startRow + 3 {
             for j in startColumn..<startColumn + 3 {
                 if board[i][j] == value {
                     return false
                 }
             }
         }
         
         return true
     }
 }
 */
