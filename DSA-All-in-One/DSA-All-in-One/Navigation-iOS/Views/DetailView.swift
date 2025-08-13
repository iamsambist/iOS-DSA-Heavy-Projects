//
//  DetailView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct DetailView: View {
    @State private var itemID: String = ""
    @EnvironmentObject private var stackManager: StackManager
    var body: some View {
        VStack {
            
            Text("Comming Id: \(itemID)")
                .onTapGesture {
                    stackManager.push(.details("i am comming again"))
                }
            
            Text("Back to Home")
                .onTapGesture {
                    stackManager.rollBack(.home)
                }
                
        }
        .onAppear {
            if case let .details(detailCase) = stackManager.currentScreen {
                self.itemID = detailCase
            }
        }
    }
}

#Preview {
    DetailView()
}
