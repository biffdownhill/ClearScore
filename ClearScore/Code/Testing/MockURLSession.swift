//
//  MockURLSession.swift
//  ClearScore
//
//  Created by Edward Downhill on 15/11/2023.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    private(set) var data: Data?
    private(set) var shouldSucceed: Bool = true
    private(set) var successStatusCode: Int = 200
    private(set) var errorStatusCode: Int = 400
    
    func setSuccess(data: Data, withStatusCode statusCode: Int = 200){
        self.shouldSucceed = true
        self.data = data
        self.successStatusCode = statusCode
    }
    func setFailure(withStatusCode statusCode: Int){
        self.shouldSucceed = false
        self.errorStatusCode = statusCode
    }
    
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)? = nil) async throws -> (Data, URLResponse) {
        guard shouldSucceed else {
            throw NSError(domain: "Mock server error", code: errorStatusCode)
        }
        
        guard let data = data else {
            throw NSError(domain: "Mock server response not initialized", code: 418)
        }
        // Simulate data retrieval from server
        let response = HTTPURLResponse(url: request.url!, statusCode: successStatusCode, httpVersion: nil, headerFields: nil)!
        return (data, response)
    }
}

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

extension URLSession : URLSessionProtocol{}
