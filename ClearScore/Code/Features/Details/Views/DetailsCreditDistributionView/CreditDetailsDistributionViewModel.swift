//
//  CreditDetailsDistributionViewModel.swift
//  ClearScore
//
//  Created by Edward Downhill on 15/11/2023.
//

import Foundation

struct CreditDetailsDistributionViewModel {
    let shortTermDebt: Int
    let shortTermCreditLimit: Int?
    
    let longTermDebt: Int
    let longTermCreditLimit: Int?
    
    var shortTermFraction: CGFloat {
        let short = CGFloat(shortTermCreditLimit ?? shortTermDebt)
        let long = CGFloat(longTermCreditLimit ?? longTermDebt)
        guard short + long != 0 else { return 0 }
        return short / (short + long)
    }
    var shortTermUtilizationFraction: CGFloat {
        guard let shortTermCreditLimit = shortTermCreditLimit,
                shortTermCreditLimit != 0
        else { return 1 }
        return CGFloat(shortTermDebt) / CGFloat(shortTermCreditLimit)
    }
    
    var longTermFraction: CGFloat {
        let short = CGFloat(shortTermCreditLimit ?? shortTermDebt)
        let long = CGFloat(longTermCreditLimit ?? longTermDebt)
        guard short + long != 0 else { return 0 }
        return short / (short + long)
    }
    var longTermUtilizationFraction: CGFloat {
        guard let longTermCreditLimit = longTermCreditLimit,
                longTermCreditLimit != 0
        else { return 1 }
        return CGFloat(longTermDebt) / CGFloat(longTermCreditLimit)
    }
}
