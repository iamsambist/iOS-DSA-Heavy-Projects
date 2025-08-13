//
//  HomeView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var stackManager: StackManager
    var body: some View {
        Text("This is Home View")
            .onTapGesture {
                stackManager.push(.details("Hello world!"))
            }
    }
}

#Preview {
    HomeView()
}
