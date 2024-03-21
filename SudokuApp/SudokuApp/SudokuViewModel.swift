//
//  SudokuViewModel.swift
//  SudokuApp
//
//  Created by yusuf on 20.03.2024.
//

import Foundation
import SwiftUI

class SudokuViewModel: ObservableObject {
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
        initialCells = sudokuModel.cells
        startTime = Date() // Oyun başladığı zamanı kaydet
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
        // Eğer boş hücre yoksa, oyun tamamlandı demektir, alerti göster
        isGameFinished = true
        timer.upstream.connect().cancel()
    }
    func earningPoint() -> Int {
        guard let startTime = startTime else { return 0 }
                let endTime = Date()
                let elapsedTime = endTime.timeIntervalSince(startTime)
                let remainingSeconds = max(0, 60 - Int(elapsedTime)) // Kalan süreyi hesapla (maksimum 60 saniye)
                
                // Puan hesaplama
                var score = 0
                if remainingSeconds >= 600 {
                    score = 1000
                } else {
                    score = remainingSeconds / 6 // Her saniye için 100 puan
                }
                
                return score
    }
}
