//
//  CustomNavigationView.swift
//  SynergyTradeCenter
//
//  Created by Edward Downhill on 21/09/2023.
//

import Foundation
import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content
        
        UINavigationBar.setCustomAppearance()
    }
    
    var body: some View {
        NavigationView {
            content()
                .navigationBarTitleDisplayMode(.large)
        }
    }
}


fileprivate extension UINavigationBar {
    
    /// Changes the font and preferred style of the default navigation bar title.
    ///
    static func setCustomAppearance(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font : UIFont.theme.largeTitle
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont.theme.headline
        ]
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
