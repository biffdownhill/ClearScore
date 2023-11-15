//
//  DonutScoreViewModel.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

struct DonutScoreViewModel {
    
    var score: Int?
    var maxScore: Int?
    var progress: CGFloat?
    
    var isLoading: Bool
    var isShowingError: Bool
    
    init<DataSource: ICreditScoreDonutDataSource>(_ dataSource: DataSource){
        if let score = dataSource.creditScore {
            self.score = score.creditReportInfo.score
            self.maxScore = score.creditReportInfo.maxScoreValue
            self.progress = CGFloat(score.creditReportInfo.score - score.creditReportInfo.minScoreValue) / CGFloat(score.creditReportInfo.maxScoreValue - score.creditReportInfo.minScoreValue)
        }
        
        self.isLoading = dataSource.isLoading
        self.isShowingError = dataSource.isShowingError
    }
}
