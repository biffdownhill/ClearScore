//
//  ICreditScoreDonutDataSource.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

protocol ICreditScoreDonutDataSource {
    var creditScore: CreditScore? { get }
    var isLoading: Bool { get }
    var isShowingError: Bool { get }
}
