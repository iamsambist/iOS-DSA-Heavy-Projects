//
//  CategoryListView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct CategoryListView: View {
   
    @EnvironmentObject private var coordinator: QuoteManager
    var body: some View {
        GeometryReader { geometry in
            let totalSpacing: CGFloat = 10 * 3
            let cellWidth = max((geometry.size.width - totalSpacing) / 2, 0)
            let cellHeight = cellWidth * 1.2
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),
                                GridItem(.flexible(), spacing: 10)],
                      spacing: 10) {
                
                ForEach(CategoryKey.allCases) { category in
                    VStack {
                        Image(systemName: icon(for: category))
                            .resizable()
                            .scaledToFit()
                            .frame(width: cellWidth * 0.6, height: cellWidth * 0.6)
                            .padding(.top, 10)
                        
                        Text(category.rawValue.uppercased())
                            .font(.headline)
                            .padding(.bottom, 10)
                    }
                    .frame(width: cellWidth, height: cellHeight)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 3)
                    .border(Color.gray.opacity(0.5))
                    .onTapGesture {
                        coordinator.push(.categoryDetail(category: category))
                    }
                }
            }
            .padding(10)
        }
    }
    
    private func icon(for category: CategoryKey) -> String {
        switch category {
        case .Love: return "heart.fill"
        case .Motivation: return "cursorarrow.motionlines"
        case .Wisdom: return "arrow.trianglehead.clockwise"
        case .Success: return "figure.surfing"
        }
    }
}


#Preview {
    CategoryListView()
        .environmentObject(QuoteManager())
}
