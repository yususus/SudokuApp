//
//  BackGroundField.swift
//  SudokuApp
//
//  Created by yusuf on 8.03.2024.
//

import SwiftUI

struct BackGroundField: View {
    var body: some View {
        ZStack{
            
        }.frame(width: 385, height: 150).background(Color.gray).clipShape(.rect(cornerRadius: 10)).opacity(0.6)
    }
}

#Preview {
    BackGroundField()
}
