//
//  DetailsViewModel.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation
import SwiftUI

struct DetailsViewModel {
    
    var score: Int?
    var scoreString: String {
        guard let score = score else { return "-" }
        return "\(score)"
    }
    var minScore: Int?
    var maxScore: Int?
    var progress: CGFloat?
    var changedScore: Int?
    
    var equifaxScoreBand: Int?
    var equifaxScoreBandDescription: String?
    
    var creditUtilizationPercentUsed: Int?
    var creditUtilizationDirectionFlag: CreditDirection?
    
    var daysUntilNextReport: Int?
    
    var currentShortTermDebt: Int?
    var currentShortTermNonPromotionalDebt: Int?
    var currentShortTermCreditLimit: Int?
    var currentShortTermCreditUtilisation: Int?
    var changeInShortTermDebt: Int?
    
    var currentLongTermDebt: Int?
    var currentLongTermNonPromotionalDebt: Int?
    var currentLongTermCreditLimit: Int?
    var currentLongTermCreditUtilisation: Int?
    var changeInLongTermDebt: Int?
    
    var isLoading: Bool
    var isShowingError: Bool
    
    init<DataSource: ICreditScoreDonutDataSource>(_ dataSource: DataSource){
        if let score = dataSource.creditScore {
            self.score = score.creditReportInfo.score
            self.minScore = score.creditReportInfo.minScoreValue
            self.maxScore = score.creditReportInfo.maxScoreValue
            if score.creditReportInfo.maxScoreValue - score.creditReportInfo.minScoreValue != 0 {
                self.progress = CGFloat(score.creditReportInfo.score - score.creditReportInfo.minScoreValue) / CGFloat(score.creditReportInfo.maxScoreValue - score.creditReportInfo.minScoreValue)
            }else{
                self.progress = 0
            }
            self.changedScore = score.creditReportInfo.changedScore
            
            self.equifaxScoreBand = score.creditReportInfo.equifaxScoreBand
            self.equifaxScoreBandDescription = score.creditReportInfo.equifaxScoreBandDescription
            
            self.creditUtilizationPercentUsed = score.creditReportInfo.percentageCreditUsed
            self.creditUtilizationDirectionFlag = .init(rawValue: score.creditReportInfo.percentageCreditUsedDirectionFlag)
            
            self.daysUntilNextReport = score.creditReportInfo.daysUntilNextReport
            
            self.currentShortTermDebt = score.creditReportInfo.currentShortTermDebt
            self.currentShortTermNonPromotionalDebt = score.creditReportInfo.currentShortTermNonPromotionalDebt
            self.currentShortTermCreditLimit = score.creditReportInfo.currentShortTermCreditLimit
            self.currentShortTermCreditUtilisation = score.creditReportInfo.currentShortTermCreditUtilisation
            self.changeInShortTermDebt = score.creditReportInfo.changeInShortTermDebt
            
            self.currentLongTermDebt = score.creditReportInfo.currentLongTermDebt
            self.currentLongTermNonPromotionalDebt = score.creditReportInfo.currentLongTermNonPromotionalDebt
            self.currentLongTermCreditLimit = score.creditReportInfo.currentLongTermCreditLimit
            self.currentLongTermCreditUtilisation = score.creditReportInfo.currentLongTermCreditUtilisation
            self.changeInLongTermDebt = score.creditReportInfo.changeInLongTermDebt
        }
        
        self.isLoading = dataSource.isLoading
        self.isShowingError = dataSource.isShowingError
    }
}

extension DetailsViewModel {
    enum CreditDirection: Int {
        case increasing = 1
        case `static` = 0
        case decreasing = -1
        
        var image: Image? {
            switch self {
            case .increasing: return Image(systemName: "arrow.up")
            case .static: return nil
            case .decreasing: return Image(systemName: "arrow.down")
            }
        }
    }
}
