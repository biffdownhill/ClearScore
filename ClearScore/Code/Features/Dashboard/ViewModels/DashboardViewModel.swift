//
//  DashboardViewModel.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

class DashboardViewModel<CreditScoreServiceType: ICreditScoreFetcher>: ObservableObject, ICreditScoreDonutDataSource {
    
    private let service: CreditScoreServiceType
    
    @Published private(set) var creditScore: CreditScore?
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var error: APIError?
    var isShowingError: Bool { return error != nil }
    
    private var loadingTask: Task<Void, Never>?
    
    init(service: CreditScoreServiceType){
        self.service = service
        
        loadingTask = Task {
            await loadCreditScore()
        }
    }
    
    func loadCreditScore() async {
        guard !isLoading else { return }
        
        await MainActor.run {
            self.isLoading = true
            self.error = nil
        }
        
        switch await service.loadCreditScore() {
        case .success(let creditScore):
            await MainActor.run {
                self.creditScore = creditScore
                self.isLoading = false
            }
        case .failure(let error):
            await MainActor.run {
                self.error = error
                self.isLoading = false
            }
        }
    }
}
