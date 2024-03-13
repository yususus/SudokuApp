//
//  deneme.swift
//  SudokuApp
//
//  Created by yusuf on 13.03.2024.
//

import SwiftUI


struct TimerView: View {
    @State private var timerValue = 10.0 // Başlangıç değeri (10 dakika)
    @State private var timerValueMinutes = 10 // Dakika olarak gösterilen değer
    @State private var timerValueSeconds = 0 // Saniye olarak gösterilen değer
    @State private var isTimerRunning = false // Timer çalışıyor mu?
    @State private var isAlertPresented = false
    @State private var isFinished = false
    @State private var navigateToGameView = false // GameView sayfasına gitmek için durum değişkeni
    
    var body: some View {
        
        HStack {
            Text("\(timerValueMinutes) :") // Dakika değerini göster
                .font(.title)
            Text("\(timerValueSeconds)") // Saniye değerini göster
                .font(.title)
            
            NavigationLink(destination: GameView(), isActive: $navigateToGameView) {
                Text("Bitir")
                    .frame(width: 65,height: 25)
                    .background(Color.white)
                    .foregroundStyle(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .onDisappear {
                isTimerRunning = false
            }
            
            
            .padding()
            
            Button(action: {
                // "Başlat" butonuna basıldığında timer'ı başlat veya durdur
                isTimerRunning = true
            }) {
                Text("Başlat")
                    .frame(width: 65,height: 25)
                    .background(Color.white)
                    .foregroundStyle(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding()
        }.frame(width: 350, height: 60).background(Color.gray).clipShape(.rect(cornerRadius: 10))
            .padding()
        
            .onAppear {
                isTimerRunning = false
            }
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                // Timer her 0.1 saniyede bir tetiklenir
                if isTimerRunning {
                    if timerValue > 0 {
                        timerValue -= 0.1
                        timerValueMinutes = Int(timerValue / 60) // Dakikaya çevir
                        timerValueSeconds = Int(timerValue.truncatingRemainder(dividingBy: 60)) // Saniyede kalan kısmı al
                    } else {
                        // Geri sayım tamamlandığında timer'ı durdur
                        isTimerRunning = false
                        isAlertPresented = true
                    }
                }
            }
            .alert(isPresented: $isAlertPresented){
                Alert(title: Text("Oyun Bitti!"), message: Text("Geri sayım tamamlandı."))
                
            }
        
        
    }
}





#Preview {
    TimerView()
}
