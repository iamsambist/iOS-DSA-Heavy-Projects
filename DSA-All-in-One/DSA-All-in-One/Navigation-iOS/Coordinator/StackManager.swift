//
//  StackManager.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import Foundation

final class StackManager: ObservableObject {
    
    @Published var stack: [AppScreen] = []
    
    var currentScreen: AppScreen? { stack.last }
    
    func push(_ screen: AppScreen) {
        stack.append(screen)
    }
    
    func pop() -> AppScreen? {
        guard !stack.isEmpty else { return nil }
        return stack.removeLast()
    }
    
    func rollBack(_ screen: AppScreen) {
        if stack.contains(screen) {
            repeat {
               _ = pop()
                
            } while stack.last != screen
        }
        else {
            stack.removeAll()
            stack.append(screen)
        }

    }
    
    
}
