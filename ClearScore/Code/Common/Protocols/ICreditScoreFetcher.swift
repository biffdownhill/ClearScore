//
//  ICreditScoreFetcher.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation
import Combine

protocol ICreditScoreFetcher: AnyObject {
    func loadCreditScore() async -> Result<CreditScore, APIError>
}
