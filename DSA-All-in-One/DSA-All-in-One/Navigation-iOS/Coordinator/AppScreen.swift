//
//  AppScreen.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import Foundation

enum AppScreen: Equatable, Hashable {
    case home
    case details(String) 
    case settings
    
    static func == (lhs: AppScreen, rhs: AppScreen ) -> Bool {
        switch (lhs, rhs) {
            case (.home, .home): return true
        case (.details(let lhsId), .details(let rhsId)): return lhsId == rhsId
        case (.settings, .settings): return true
        default: return false
        }
    }
   
}
