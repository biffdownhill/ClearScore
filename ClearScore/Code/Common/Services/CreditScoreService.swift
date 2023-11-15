//
//  CreditScoreService.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation
import Combine

class CreditScoreService: ICreditScoreFetcher {
    
    private let urlString: String = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    private let urlSession: any URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func loadCreditScore() async -> Result<CreditScore, APIError> {
        do {
            let creditScore = try await loadCreditScoreFromServer()
            return .success(creditScore)
        } catch let error as APIError {
            return .failure(error)
        } catch {
            print("CreditScoreService:: - Unknown error loading credit score: \(error.localizedDescription)")
            return .failure(.unknown)
        }
    }
    
    /// Load the user's credit score from the server.
    private func loadCreditScoreFromServer() async throws -> CreditScore {
        let data = try await performURLRequest()
        
        let creditScore = try await parseURLResponse(data)
        
        return creditScore
    }
    
    /// Makes the URL request and returns the JSON data.
    private func performURLRequest() async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await urlSession.data(for: request, delegate: nil)
            
            // Cache response
            let cachedResponse = CachedURLResponse(response: response, data: data)
            URLCache.shared.storeCachedResponse(cachedResponse, for: request)
            
            return data
        } catch let error as NSError {
            print("CreditScoreService:: - Error loading credit score: \(error.localizedDescription)")
            switch error.code {
            case 401, 403:
                throw APIError.authenticationError
            default:
                throw APIError.serverError
            }
        }
    }
    
    /// Attempts to parse the JSON data into the CreditScore model.
    private func parseURLResponse(_ data: Data) async throws -> CreditScore {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(CreditScore.self, from: data)
        } catch {
            throw APIError.parsingError
        }
    }
}
