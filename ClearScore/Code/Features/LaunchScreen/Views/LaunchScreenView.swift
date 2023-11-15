//
//  LaunchScreenView.swift
//  SynergyTradeCenter
//
//  Created by Edward Downhill on 05/10/2023.
//

import SwiftUI

struct LaunchScreenView: View {
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            Image("clearscore.icon")
                .resizable()
                .scaledToFit()
                .foregroundColor(.theme.text)
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    LaunchScreenView()
}
