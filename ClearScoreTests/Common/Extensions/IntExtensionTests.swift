//
//  IntExtensionTests.swift
//  ClearScoreTests
//
//  Created by Edward Downhill on 15/11/2023.
//

import XCTest
@testable import ClearScore

final class IntExtensionTests: XCTestCase {
    
    // MARK: - Optional<Int> Extension Tests
    
    func testOptionalIntToString() {
        // Given
        let intValue: Int? = 42
        
        // When
        let stringValue = intValue.toString()
        
        // Then
        XCTAssertEqual(stringValue, "42")
    }
    
    func testOptionalIntToStringNilCase() {
        // Given
        let intValue: Int? = nil
        
        // When
        let stringValue = intValue.toString()
        
        // Then
        XCTAssertNil(stringValue)
    }
    
    // MARK: - Int Extension Tests
    
    func testIntToCurrencyString() {
        // Given
        let intValue: Int = 100
        
        // When
        let currencyString = intValue.toCurrencyString()
        
        // Then
        XCTAssertEqual(currencyString, "£100.00")
    }
    
    func testIntToPercentageString() {
        // Given
        let intValue: Int = 50
        
        // When
        let percentageString = intValue.toPercentageString()
        
        // Then
        XCTAssertEqual(percentageString, "50%")
    }
    
    func testIntToChangeCurrencyStringPositive() {
        // Given
        let intValue: Int = 25
        
        // When
        let changeCurrencyString = intValue.toChangeCurrencyString()
        
        // Then
        XCTAssertEqual(changeCurrencyString, "+£25.00")
    }
    
    func testIntToChangeCurrencyStringNegative() {
        // Given
        let intValue: Int = -25
        
        // When
        let changeCurrencyString = intValue.toChangeCurrencyString()
        
        // Then
        XCTAssertEqual(changeCurrencyString, "£-25.00")
    }
    
    func testIntToChangeCurrencyStringNilCase() {
        // Given
        let intValue: Int = 0
        
        // When
        let changeCurrencyString = intValue.toChangeCurrencyString()
        
        // Then
        XCTAssertNil(changeCurrencyString)
    }
}
