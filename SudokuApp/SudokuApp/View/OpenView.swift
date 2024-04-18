//
//  OpenView.swift
//  SudokuApp
//
//  Created by yusuf on 18.04.2024.
//

import SwiftUI

struct OpenView: View {
    @State private var showingSplash = true
       
       var body: some View {
           ZStack {
               if showingSplash {
                   // Splash ekranı burada
                   SplashBackGround()
                       .onAppear {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                               // Splash ekranını kaldır
                               withAnimation {
                                   showingSplash = false
                               }
                           }
                       }
               } else {
                   // Ana oyun ekranı burada
                   GameView()
               }
           }
       }
   }

#Preview {
    OpenView()
}
