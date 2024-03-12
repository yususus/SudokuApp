//
//  GameView.swift
//  SudokuApp
//
//  Created by yusuf on 12.03.2024.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Oyun seçiniz")
                .font(.custom("", size: 40)).foregroundStyle(Color.blue)
                .frame(width: 300, height: 100)
                
            Spacer()
            Button(action: {}, label: {
                Text("Kolay")
                    .frame(width: 100, height: 30)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(.rect(cornerRadius: 10))
            })
            Button(action: {}, label: {
                Text("Orta")
                    .frame(width: 100, height: 30)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(.rect(cornerRadius: 10))
            })
            Button(action: {}, label: {
                Text("Zor")
                    .frame(width: 100, height: 30)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(.rect(cornerRadius: 10))
            })
            Spacer()
        }.background(BackGround2())
        
    }
}

#Preview {
    GameView()
}
