//
//  QuoteManager.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import Foundation

final class QuoteManager: ObservableObject {
    
    @Published var stack: [QuoteScreens] = []
    
    var currentScreen: QuoteScreens? { stack.last }
    
    func push(_ screen: QuoteScreens) {
        stack.append(screen)
    }
    
    func pop() -> QuoteScreens? {
        guard !stack.isEmpty else { return nil }
        return stack.removeLast()
    }
    
    func rollBack(_ screen: QuoteScreens) {
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
