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
    
    init() {
        cells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
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
}

