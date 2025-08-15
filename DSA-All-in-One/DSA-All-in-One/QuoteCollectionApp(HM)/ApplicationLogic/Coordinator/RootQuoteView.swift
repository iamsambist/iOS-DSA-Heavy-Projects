//
//  RootQuoteView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct RootQuoteView: View {
    @StateObject private var quoteAppManager: QuoteManager = QuoteManager()
    var body: some View {
        NavigationStack(path: $quoteAppManager.stack) {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.gray)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationDestination(for: QuoteScreens.self){ screen in
                quoteAppDestination(for: screen)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                    quoteAppManager.push(.category)
                }
            }
        }
    }
    
    @ViewBuilder
    private func quoteAppDestination(for route: QuoteScreens) -> some View {
        switch route {
        case .category:
            CategoryListView()
                .environmentObject(quoteAppManager)
                .navigationBarBackButtonHidden(true)
        case .categoryDetail(let category):
            CategoryDetailView()
                .environmentObject(quoteAppManager)
                
        }
    }
 
}

#Preview {
    RootQuoteView()
}
