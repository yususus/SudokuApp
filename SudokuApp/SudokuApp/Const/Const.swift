//
//  Const.swift
//  SudokuApp
//
//  Created by yusuf on 7.03.2024.
//

import Foundation
import SwiftUI

class Const{
    static let alertMessage: String = "Game time is over."
    @ViewBuilder
    static func PointsText(minutes: String, point: String) -> some View{
        Text("If you finish in \(minutes) minutes you will get \(point) points").fontWeight(.bold)
    }
}
