//
//  SnowballProjectUITestsLaunchTests.swift
//  SnowballProjectUITests
//
//  Created by Pelin Üstünel on 1.09.2024.
//

import XCTest

final class SnowballProjectUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
 
    }
}
