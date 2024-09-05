//
//  Buton.swift
//  Genius Sudoku
//
//  Created by yusuf on 5.09.2024.
//

import SwiftUI

struct SelectDiffuclty: View {
    var title: String
    var color: Color
    var difficulty: SudokuViewModel.Difficulty
    @Binding var selectedDifficulty: SudokuViewModel.Difficulty
    @Binding var navigateToContentView: Bool
    var body: some View {
        Button(action: {
            selectedDifficulty = difficulty
            navigateToContentView = true
        }) {
            Text(title).font(.title2)
                .fontDesign(.rounded)
                .frame(width: 100, height: 50)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SelectDiffuclty(title: "medium", color: .orange, difficulty: .medium, selectedDifficulty: .constant(.medium), navigateToContentView: .constant(true))
}
