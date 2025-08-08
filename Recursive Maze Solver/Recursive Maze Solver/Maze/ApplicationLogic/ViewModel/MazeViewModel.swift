//
//  MazeViewModel.swift
//  Recursive Maze Solver
//
//  Created by MacBook Two on 08/08/2025.
//

import Foundation


final class MazeViewModel: ObservableObject {
    @Published var row: Int = 0
    @Published var col: Int = 0
    @Published var mazeitems: [[MazeItem]] = []
    init (col: Int, row: Int) {
        self.row = row
        self.col = col
        var items: [[MazeItem]] = []
        for _ in 0..<row {
            var rowItems: [MazeItem] = []
            for _ in 0..<col {
                rowItems.append(MazeItem(isWall: false, isVisited: false))
            }
            items.append(rowItems)
        }
        
        self.mazeitems = items
    }
    
    func solveMaze( _ x: Int = 0, _ y: Int = 0 ) -> Bool {
        if x == row - 1 && y == col - 1 {
            mazeitems[x][y].isVisited = true
            return true
        }
        
        if isSafe(mazeitems, x, y ) {
            
            mazeitems[x][y].isVisited = true
            if solveMaze( x + 1, y ) {
                return true
            }
            if solveMaze( x, y + 1 ) {
                return true
            }
            
            if solveMaze( x - 1, y ) {
                return true
            }
            
            if solveMaze( x, y - 1 ) {
                return true
            }
            
            mazeitems[x][y].isVisited = false
            return false
        }
        
        return false
    }
    
    func isSafe(_ maze: [[MazeItem]], _ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < maze.count &&
               y >= 0 && y < maze[0].count &&
        maze[x][y].isWall == false && maze[x][y].isVisited == false
    }
    
    
}
