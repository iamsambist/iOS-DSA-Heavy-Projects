//
//  CategoryDetailView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct CategoryDetailView: View {
    @StateObject private var viewModel = QuoteViewModel()
    @EnvironmentObject private var coordinator: QuoteManager
    @State private var quotes: [String] = []
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ForEach(viewModel.quotes, id: \.self) { quote in
                    VStack(alignment: .leading) {
                        Text(quote)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    
                }
            }
        }
        .onAppear {
            if case let .categoryDetail(category)  = coordinator.currentScreen {
                viewModel.fetchQuotes(for: category)
            }
        }
    }
    
   
}

#Preview {
    CategoryDetailView()
        .environmentObject(QuoteManager())
}
