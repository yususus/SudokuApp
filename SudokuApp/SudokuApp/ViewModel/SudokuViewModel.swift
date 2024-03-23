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
    @Published var isGameStarted = false // Oyunun başlayıp başlamadığını kontrol eder
    @Published var isGameFinished = false
    @Published var isTimeEnd = false
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var startTime: Date? //başlangıç zamanı kaydetme işlemi
    
    func startGame() {
        isGameStarted = true
        sudokuModel.initializeRandomNumbers() // Önce rastgele sayıları başlat
        initialCells = sudokuModel.cells // Sonra başlangıç hücrelerini güncelle
        startTime = Date() // Oyun başladığı zamanı kaydet
    }

    func selectCell(row: Int, column: Int) {
        if initialCells[row][column] == 0 {
                selectedRow = row
                selectedColumn = column
            } else {
                selectedRow = -1
                selectedColumn = -1
            }
        }
    
    func resetCell() {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            sudokuModel.cells[selectedRow][selectedColumn] = initialCells[selectedRow][selectedColumn]
        }
    }
    
    func placeNumber(number: Int) {
        if isGameStarted && selectedRow != -1 && selectedColumn != -1 {
            // Yalnızca başlangıçta boş olan hücrelere sayı yerleştirilebilir
            if initialCells[selectedRow][selectedColumn] == 0 && sudokuModel.isValidMove(row: selectedRow, column: selectedColumn, value: number) {
                sudokuModel.cells[selectedRow][selectedColumn] = number
            }
        }
        checkGameCompletion()
    }

    func checkGameCompletion() {
        // Tüm hücrelerin değerlerini kontrol et
        for row in 0..<9 {
            for column in 0..<9 {
                // Herhangi bir boş hücre varsa, oyun devam ediyor demektir
                if sudokuModel.cells[row][column] == 0 {
                    return
                }
            }
        }
        isGameFinished = true // Oyun tamamlandı olarak işaretle
        if isGameFinished == true{
            print("oyun bitti")
            let earnedScore = earningPoint() // Kazanılan puanı alın
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
        // 300 saniye içinde tamamlanırsa 1000 puan
        return 1000
      case 300..<500:
        // 300 ile 500 saniye arasında tamamlanırsa 500 puan
        return 500
      case 500..<900:
        // 500 ile 900 saniye arasında tamamlanırsa 100 puan
        return 100
      default:
        // 900 saniyeden fazla sürerse puan verme
        return 0
      }
    }

}
