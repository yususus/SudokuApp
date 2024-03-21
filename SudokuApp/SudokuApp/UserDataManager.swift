//
//  UserDataManager.swift
//  SudokuApp
//
//  Created by yusuf on 21.03.2024.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    private let totalScoreKey = "TotalScore"
    
    func saveScore(score: Int) {
        let totalScore = UserDefaults.standard.integer(forKey: totalScoreKey)
        let newTotalScore = totalScore + score
        UserDefaults.standard.set(newTotalScore, forKey: totalScoreKey)
    }
    
    func getTotalScore() -> Int {
        return UserDefaults.standard.integer(forKey: totalScoreKey)
    }
    
    func resetScore() {
        UserDefaults.standard.removeObject(forKey: totalScoreKey)
    }
}
