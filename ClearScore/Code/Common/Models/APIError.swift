//
//  APIError.swift
//  ClearScore
//
//  Created by Edward Downhill on 14/11/2023.
//

import Foundation

enum APIError: LocalizedError {
    
    case invalidURL
    case authenticationError
    case serverError
    case parsingError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .authenticationError:
            return "Authentication error"
        case .serverError:
            return "Server error"
        case .parsingError:
            return "Unable to parse JSON data"
        case .unknown:
            return "Unknown error"
        }
    }
}
