//
//  SplashView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var stackManager: StackManager
    var body: some View {
        VStack {
            Text("This is Setting View")
                .onTapGesture {
                   
                }
        }
        .onAppear {
            print("appearing Setting screen")
        }
    }
       
}

#Preview {
    SettingView()
        .environmentObject(StackManager())
}
