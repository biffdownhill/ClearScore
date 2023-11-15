//
//  CreditScoreServiceTests.swift
//  ClearScoreTests
//
//  Created by Edward Downhill on 15/11/2023.
//

import XCTest
@testable import ClearScore

final class CreditScoreServiceTests: XCTestCase {
    
    var mockURLSession: MockURLSession!
    var creditScoreService: CreditScoreService!
    
    override func setUpWithError() throws {
        // Set up the service with a mock URLSession
        mockURLSession = MockURLSession()
        creditScoreService = CreditScoreService(urlSession: mockURLSession)
    }
    
    // MARK: - loadCreditScore Tests
    
    func testLoadCreditScore_Success() async throws {
        // Given
        let fileURL = Bundle(for: CreditScoreServiceTests.self).url(forResource: "credit_score_response", withExtension: "json")!
        let data = try Data(contentsOf: fileURL)
        mockURLSession.setSuccess(data: data)
        
        // When
        let result = await creditScoreService.loadCreditScore()
        
        // Then
        switch result {
        case .success(_):
            return
        case .failure(let error):
            XCTFail("Expected success but got failure: \(error.localizedDescription)")
        }
    }
    
    func testLoadCreditScore_403AuthenticationError() async throws {
        // Given
        mockURLSession.setFailure(withStatusCode: 403)
        
        // When
        let result = await creditScoreService.loadCreditScore()
        
        // Then
        switch result {
        case .success(_):
            XCTFail("Expected auth error but got success")
        case .failure(let error):
            XCTAssertEqual(error, APIError.authenticationError, "Expected auth error: \(error.localizedDescription)")
        }
    }
    
    func testLoadCreditScore_401AuthenticationError() async throws {
        // Given
        mockURLSession.setFailure(withStatusCode: 401)
        
        // When
        let result = await creditScoreService.loadCreditScore()
        
        // Then
        switch result {
        case .success(_):
            XCTFail("Expected auth error but got success")
        case .failure(let error):
            XCTAssertEqual(error, APIError.authenticationError, "Expected auth error: \(error.localizedDescription)")
        }
    }
    
    func testLoadCreditScore_ServerError() async throws {
        // Given
        mockURLSession.setFailure(withStatusCode: 418)
        
        // When
        let result = await creditScoreService.loadCreditScore()
        
        // Then
        switch result {
        case .success(_):
            XCTFail("Expected server error but got success")
        case .failure(let error):
            XCTAssertEqual(error, APIError.serverError, "Expected server error: \(error.localizedDescription)")
        }
    }
    
    func testLoadCreditScore_ParseError() async throws {
        // Given
        let fileURL = Bundle(for: CreditScoreServiceTests.self).url(forResource: "credit_score_invalid_response", withExtension: "json")!
        let data = try Data(contentsOf: fileURL)
        mockURLSession.setSuccess(data: data)
        
        // When
        let result = await creditScoreService.loadCreditScore()
        
        // Then
        switch result {
        case .success(_):
            return
        case .failure(let error):
            XCTAssertEqual(error, APIError.parsingError, "Expected parsing error: \(error.localizedDescription)")
        }
    }
}
