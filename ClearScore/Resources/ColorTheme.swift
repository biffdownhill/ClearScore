//
//  ColorTheme.swift
//  Synergy Trade Center
//
//  Created by Edward Downhill on 07/09/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    
    let background = Color("BackgroundColor")
    
    let text = Color("TextColor")
    let textSeconary = Color("TextSecondaryColor")
    
    let yellow = Color("YellowColor")
    let orange = Color("OrangeColor")
}
