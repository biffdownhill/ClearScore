//
//  ClearScoreApp.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import SwiftUI

@main
struct ClearScoreApp: App {
    
    @State private var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            content
        }
    }
}

extension ClearScoreApp {
    
    private var content: some View {
        ZStack {
            if showLaunchScreen {
                LaunchScreenView()
                    .transition(.opacity)
                    .zIndex(2)
            }
            
            CustomNavigationView {
                DashboardView()
            }
            .zIndex(1)
        }
        .foregroundColor(.theme.text)
        .onAppear {
            withAnimation {
                showLaunchScreen = false
            }
        }
    }
}
