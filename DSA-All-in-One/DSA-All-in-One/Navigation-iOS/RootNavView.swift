//
//  ContentView.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import SwiftUI

struct RootNavView: View {
    @StateObject private var stackManager: StackManager = StackManager()
    var body: some View {
        NavigationStack(path: $stackManager.stack) {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.gray)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationDestination(for: AppScreen.self){ screen in
                destinationView(for: screen)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                    stackManager.push(.home)
                }
            }
        }
    }
    
    @ViewBuilder
      private func destinationView(for route: AppScreen) -> some View {
          switch route {
              
          case .home:
              HomeView()
                  .environmentObject(stackManager)
                  .navigationBarBackButtonHidden(true)
          case .details(_):
              
              DetailView()
                  .environmentObject(stackManager)
                  
              
          case .settings:
              SettingView()
                .environmentObject(stackManager)
                .navigationBarBackButtonHidden(true)
          }
      }
}

#Preview {
    RootNavView()
}
