//
//  FontTheme.swift
//  Synergy Trade Center
//
//  Created by Edward Downhill on 07/09/2023.
//

import Foundation
import SwiftUI

// MARK: UIFont

extension UIFont {
    static let theme = UIFontTheme()
}

struct UIFontTheme {
    
    let largeTitle: UIFont = UIFont(name: "Satoshi-Black", size: 34)!
    let title: UIFont = UIFont(name: "Satoshi-Bold", size: 28)!
    let title2: UIFont = UIFont(name: "Satoshi-Bold", size: 24)!
    let title3: UIFont = UIFont(name: "Satoshi-Bold", size: 20)!
    let subtitle: UIFont = UIFont(name: "Satoshi-Medium", size: 24)!
    let headline: UIFont = UIFont(name: "Satoshi-Bold", size: 18)!
    let subheadline: UIFont = UIFont(name: "Satoshi-Medium", size: 16)!
    let value: UIFont = UIFont(name: "Satoshi-Bold", size: 40)!
    let body: UIFont = UIFont(name: "Figtree-Regular", size: 18)!
    let caption: UIFont = UIFont(name: "Satoshi-Bold", size: 12)!
    let caption2: UIFont = UIFont(name: "Satoshi-Regular", size: 10)!
}


// MARK: Font

extension Font {
    static let theme = FontTheme()
}

struct FontTheme {
    
    let largeTitle: Font = Font.custom("Satoshi-Black", size: 34)
    let title: Font = Font.custom("Satoshi-Bold", size: 28)
    let title2: Font = Font.custom("Satoshi-Bold", size: 24)
    let title3: Font = Font.custom("Satoshi-Bold", size: 20)
    let subtitle: Font = Font.custom("Satoshi-Medium", size: 24)
    let headline: Font = Font.custom("Satoshi-Bold", size: 18)
    let subheadline: Font = Font.custom("Satoshi-Medium", size: 16)
    let value: Font = Font.custom("Satoshi-Bold", size: 40)
    let body: Font = Font.custom("Figtree-Regular", size: 18)
    let caption: Font = Font.custom("Satoshi-Bold", size: 12)
    let caption2: Font = Font.custom("Satoshi-Bold", size: 10)
}
