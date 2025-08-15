//
//  QuoteViewModel.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 15/08/2025.
//

import Foundation

final class QuoteViewModel: ObservableObject {
    @Published var quotes: [String] = []
    
    private let dataSource: DataProvider
    init (dataSource: DataProvider = DataProvider() ) {
        self.dataSource = dataSource
    }
    
    func fetchQuotes(for category: CategoryKey) {
        self.quotes = dataSource.provideQuotes(for: category)
    }
    
    
}
