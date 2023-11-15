//
//  CreditDetailsDistributionViewModelTests.swift
//  ClearScoreTests
//
//  Created by Edward Downhill on 15/11/2023.
//

import XCTest
@testable import ClearScore

final class CreditDetailsDistributionViewModelTests: XCTestCase {
    
    // Test cases for shortTermFraction
    func testShortTermFraction_WhenShortAndLongAreZero_ReturnsZero() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: nil, longTermDebt: 0, longTermCreditLimit: nil)
        
        // When
        let result = viewModel.shortTermFraction
        
        // Then
        XCTAssertEqual(result, 0)
    }
    
    func testShortTermFraction_WhenOnlyShortIsNonZero_ReturnsOne() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 50, shortTermCreditLimit: 100, longTermDebt: 0, longTermCreditLimit: nil)
        
        // When
        let result = viewModel.shortTermFraction
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    // Test cases for shortTermUtilizationFraction
    func testShortTermUtilizationFraction_WhenCreditLimitIsZero_ReturnsOne() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 50, shortTermCreditLimit: 0, longTermDebt: 0, longTermCreditLimit: nil)
        
        // When
        let result = viewModel.shortTermUtilizationFraction
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testShortTermUtilizationFraction_WhenDebtIsZero_ReturnsZero() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: 100, longTermDebt: 0, longTermCreditLimit: nil)
        
        // When
        let result = viewModel.shortTermUtilizationFraction
        
        // Then
        XCTAssertEqual(result, 0)
    }
    
    // Test cases for longTermFraction
    func testLongTermFraction_WhenShortAndLongAreZero_ReturnsZero() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: nil, longTermDebt: 0, longTermCreditLimit: nil)
        
        // When
        let result = viewModel.longTermFraction
        
        // Then
        XCTAssertEqual(result, 0)
    }
    
    func testLongTermFraction_WhenOnlyLongIsNonZero_ReturnsOne() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: nil, longTermDebt: 50, longTermCreditLimit: 100)
        
        // When
        let result = viewModel.longTermFraction
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    // Test cases for longTermUtilizationFraction
    func testLongTermUtilizationFraction_WhenCreditLimitIsZero_ReturnsOne() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: nil, longTermDebt: 50, longTermCreditLimit: 0)
        
        // When
        let result = viewModel.longTermUtilizationFraction
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testLongTermUtilizationFraction_WhenDebtIsZero_ReturnsZero() {
        // Given
        let viewModel = CreditDetailsDistributionViewModel(shortTermDebt: 0, shortTermCreditLimit: nil, longTermDebt: 0, longTermCreditLimit: 100)
        
        // When
        let result = viewModel.longTermUtilizationFraction
        
        // Then
        XCTAssertEqual(result, 0)
    }
}
