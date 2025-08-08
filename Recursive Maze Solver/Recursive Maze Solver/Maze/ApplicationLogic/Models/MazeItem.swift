//
//  MazeItem.swift
//  Recursive Maze Solver
//
//  Created by MacBook Two on 08/08/2025.
//

import Foundation

struct MazeItem: Identifiable {
    var id = UUID()
    var isWall: Bool
    var isVisited: Bool
    var isPath: Bool = true
}
