//
//  GameView.swift
//  Recursive Maze Solver
//
//  Created by MacBook Two on 08/08/2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: MazeViewModel
    var onCloseGame: (() -> Void)
    init(column: Int, row: Int, `var` closeGame: @escaping () -> Void) {
        self.onCloseGame = closeGame
        _viewModel = StateObject(wrappedValue: MazeViewModel(col: column, row: row))
    }

    var columns: [GridItem] {
        
        Array(repeating: GridItem(.flexible(), spacing: 10), count: viewModel.col)
    }
    
    var body: some View {
        VStack {
            VStack (spacing: 10){
                Text("Game will start at First Cell index 0,0 and ends at the last cell, You can place obstacles in the way and see how algorithm finds the way")
                Text("Tap on item to make it obstacles")
            }
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
          
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<(viewModel.row * viewModel.col), id: \.self) { index in
                        let row = index / viewModel.col
                        let col = index % viewModel.col
                        let item = viewModel.mazeitems[row][col]

                        Rectangle()
                            .fill(
                                item.isWall ? Color.red :
                                item.isVisited ? Color.gray :
                                Color.green.opacity(0.6)
                            )
                            .frame(height: 80)
                            .cornerRadius(10)
                            .onTapGesture {
                                if (row == 0 && col == 0) || (row == viewModel.row - 1 && col == viewModel.col - 1) {
                                    return
                                } else {
                                    viewModel.mazeitems[row][col].isWall.toggle()
                                }
                            }
                    }
                }

                     .padding()
                     .overlay {
                         RoundedRectangle(cornerRadius: 10)
                             .stroke(Color.gray, lineWidth: 1)
                             .padding(.horizontal, 5)
                         
                     }
                     .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
                     
                 }
            HStack {
                Button(action: {
                    Task {
                            let solved = await viewModel.solveMaze()
                            print("Maze solved:", solved)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            viewModel.gameOver.toggle()
                        }
                }
                }, label: {
                    Text("Let's Begin")
                        .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(Color.green.opacity(0.6))
                .cornerRadius(10)
                
                
                Button(action: {
                    onCloseGame()
                }, label: {
                    Text("New Grid")
                        .foregroundStyle(.white)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(Color.green.opacity(0.6))
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            
           
            
            
            
           
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    GameView(column: 3, row: 3, var: {})
}
