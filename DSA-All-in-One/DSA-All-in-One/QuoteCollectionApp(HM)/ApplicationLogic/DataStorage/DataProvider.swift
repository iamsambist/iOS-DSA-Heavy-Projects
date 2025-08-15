//
//  DataProvider.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 15/08/2025.
//

import Foundation

final class DataProvider {
    
    private var dataContainer: [CategoryKey: QouteListHandler] = [.Love: LoveQuotes(), .Motivation: MotivationQuotes(), .Success: SuccessQuotes(), .Wisdom: WisdomQuotes()]
    
    func provideQuotes(for category: CategoryKey) -> [String] {
        let quoteHandler = dataContainer[category] ?? LoveQuotes()
        return quoteHandler.quotes
    }
    
}
