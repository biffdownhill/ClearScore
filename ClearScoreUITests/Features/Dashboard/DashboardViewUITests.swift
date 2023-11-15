//
//  DashboardViewUITests.swift
//  ClearScoreUITests
//
//  Created by Edward Downhill on 15/11/2023.
//

import XCTest

final class DashboardViewUITests: XCTestCase {
    
    func testDashboardView_Presentation() throws {
        // Set up your app instance
        let app = XCUIApplication()
        app.launch() // Ensure your app is launched
        
        let dashboardDonutTextView = app.staticTexts["DashboardDonutTextView"]
        XCTAssertTrue(dashboardDonutTextView.exists, "Dashboard donut text view should exist")
        
        // Tap on the center view to present details
        dashboardDonutTextView.tap()
        
        // Check if the details view is presented
        let detailsScoreView = app.staticTexts["DetailsScoreView"]
        XCTAssertTrue(detailsScoreView.exists, "Details score view should be presented")
        
        // Dismiss the details view
        app.navigationBars["Overview"].buttons["Close"].tap()
        
        // Verify that the details view is dismissed
        XCTAssertFalse(detailsScoreView.exists, "Details score view should be dismissed")
    }
}
