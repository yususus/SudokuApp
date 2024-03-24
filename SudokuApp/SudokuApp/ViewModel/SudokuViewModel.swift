//
//  SudokuViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 20.03.2024.
//

import Foundation
import SwiftUI

class SudokuViewModel: ObservableObject {
    @State private var totalScore = UserDataManager.shared.getTotalScore()
    @Published var sudokuModel = SudokuModel()
    @Published var initialCells: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var selectedRow = -1
    @Published var selectedColumn = -1
    @Published var isGameStarted = false // start game bool
    @Published var isGameFinished = false

    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var startTime: Date?
    
    func startGame() {
        isGameStarted = true
        sudokuModel.fillBoard() // Önce rastgele sayıları başlat, initialize random cells first
        initialCells = sudokuModel.cells // Sonra başlangıç hücrelerini güncelle, Then update the starting cells
        startTime = Date()
    }
    // önce rastgele sayıları başlatma nedenimiz bu sayıları oyunun içine gömmek gibi düşünülebilir.
    // The reason why we initialize random numbers first can be thought of as embedding these numbers into the game.
    
    func selectCell(row: Int, column: Int) {
        if initialCells[row][column] == 0 {
                selectedRow = row
                selectedColumn = column
            } else {
                selectedRow = -1
                selectedColumn = -1
            }
        }
    //only resets the selected cells
    func resetCell() {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            sudokuModel.cells[selectedRow][selectedColumn] = initialCells[selectedRow][selectedColumn]
        }
    }
    
    func placeNumber(number: Int) {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            // başlangıçta boş olan hücrelere sayı yerleştir
            if initialCells[selectedRow][selectedColumn] == 0 && sudokuModel.isValidMove(row: selectedRow, column: selectedColumn, value: number) {
                sudokuModel.cells[selectedRow][selectedColumn] = number
            }
        }
        checkGameCompletion()
    }

    func checkGameCompletion() {
        for row in 0..<9 {
            for column in 0..<9 {
                // boş hücre varsa oyun devam eder
                //if there is an empty cell , the game continues
                if sudokuModel.cells[row][column] == 0 {
                    return
                }
            }
        }
        isGameFinished = true
        if isGameFinished == true{
            print("oyun bitti")
            let earnedScore = earningPoint() // get earned points
            UserDataManager.shared.saveScore(score: earnedScore)
            self.totalScore = UserDataManager.shared.getTotalScore()
        }
        timer.upstream.connect().cancel()
    }
    func earningPoint() -> Int {
      guard let startTime = startTime else { return 0 }
      let endTime = Date()
      let elapsedTime = endTime.timeIntervalSince(startTime)
      
      switch elapsedTime {
      case 0..<300:
        // 5dk 1000 puan
        return 1000
      case 300..<600:
        return 750
      case 600..<900:
        return 500
      case 900..<1200:
        return 250
      case 1200..<1500:
        return 100
      case 1500..<1800:
        return 50
      default:
        // 30dk sonra puan yok
        return 0
      }
    }

}
