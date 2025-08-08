//
//  OnBoardingScreen.swift
//  Recursive Maze Solver
//
//  Created by MacBook Two on 08/08/2025.
//

import SwiftUI

struct OnBoardingScreen: View {
    @State var isOnBoardingCompleted: Bool = false
    @State var coloumn: Int = 3
    @State var row: Int = 3
    var body: some View {
        if isOnBoardingCompleted {
            GameView(column: coloumn, row: row)
        } else {
            MazeSelectionView() { row, col in
                self.row = row
                self.coloumn = col
                self.isOnBoardingCompleted.toggle()
            }
        }
       
    }
}

#Preview {
    OnBoardingScreen()
}
