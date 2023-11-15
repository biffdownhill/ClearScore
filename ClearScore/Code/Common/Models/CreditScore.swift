//
//  CreditScore.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

struct CreditScore: Codable {
    var accountIDVStatus: String
    var creditReportInfo: CreditReportInfo
    var dashboardStatus: String
    var personaType: String
    var coachingSummary: CoachingSummary
    var augmentedCreditScore: Int?
}


extension CreditScore: Stubbable {
    
    static func stub() -> CreditScore {
        CreditScore(
            accountIDVStatus: "PASS",
            creditReportInfo: CreditReportInfo(
                score: 514,
                scoreBand: 4,
                clientRef: "CS-SED-655426-708782",
                status: "MATCH",
                minScoreValue: 0,
                maxScoreValue: 700,
                monthsSinceLastDefaulted: -1,
                hasEverDefaulted: false,
                monthsSinceLastDelinquent: 1,
                hasEverBeenDelinquent: true,
                percentageCreditUsed: 44,
                percentageCreditUsedDirectionFlag: 1,
                changedScore: 0,
                currentShortTermDebt: 13758,
                currentShortTermNonPromotionalDebt: 13758,
                currentShortTermCreditLimit: 30600,
                currentShortTermCreditUtilisation: 44,
                changeInShortTermDebt: 549,
                currentLongTermDebt: 24682,
                currentLongTermNonPromotionalDebt: 24682,
                currentLongTermCreditLimit: nil, // Nullable
                currentLongTermCreditUtilisation: nil, // Nullable
                changeInLongTermDebt: -327,
                numPositiveScoreFactors: 9,
                numNegativeScoreFactors: 0,
                equifaxScoreBand: 4,
                equifaxScoreBandDescription: "Excellent",
                daysUntilNextReport: 9
            ),
            dashboardStatus: "PASS",
            personaType: "INEXPERIENCED",
            coachingSummary: CoachingSummary(
                activeTodo: false,
                activeChat: true,
                numberOfTodoItems: 0,
                numberOfCompletedTodoItems: 0,
                selected: true
            ),
            augmentedCreditScore: nil // Nullable
        )
    }
}
