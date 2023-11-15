//
//  IntExtension.swift
//  ClearScore
//
//  Created by Edward Downhill on 15/11/2023.
//

import Foundation

extension Optional where Wrapped == Int {
    func toString() -> String? {
        guard let value = self else { return nil }
        return "\(value)"
    }
}

extension Int {
    func toCurrencyString(currencyCode: String = "GBP") -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "GBP"
        return formatter.string(from: self as NSNumber)
    }
    
    func toPercentageString() -> String {
        return "\(self)" + "%"
    }
    
    func toChangeCurrencyString() -> String? {
        guard let currencyString = self.toCurrencyString() else { return nil }
        return self >= 0 ? "+" + currencyString : currencyString
    }
}
