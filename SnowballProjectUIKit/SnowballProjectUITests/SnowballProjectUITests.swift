//
//  SnowballProjectUITests.swift
//  SnowballProjectUITests
//
//  Created by Pelin Üstünel on 1.09.2024.
//

import XCTest

final class SnowballProjectUITests: XCTestCase {
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    
    //    func testAllMenusTableViewCellsLoads() throws {
    //        let app = XCUIApplication()
    //        app.launch()
    //
    //        let menuIdentifiers = ["Waiting", "Script", "Log", "Deploy"]
    //
    //        for menuIdentifier in menuIdentifiers {
    //
    //            let menuButton = app.buttons[menuIdentifier]
    //            if !menuButton.waitForExistence(timeout: 20) {
    //                XCTFail("\(menuIdentifier) menüsü bulunamadı.")
    //                return // Hata oluştuğunda işlemi durdur
    //            }
    //            menuButton.tap()
    //
    //
    //            if menuIdentifier == "Waiting" || menuIdentifier == "Log" {
    //                print("\(menuIdentifier) menüsünde detay sayfası bulunmuyor, atlanıyor.")
    //                continue
    //            }
    //
    //
    //            let tableView = app.tables.firstMatch
    //            if !tableView.waitForExistence(timeout: 20) {
    //                XCTFail("\(menuIdentifier) menüsündeki TableView bulunamadı.")
    //                return
    //            }
    //
    //            let cells = tableView.cells
    //            if cells.count == 0 {
    //                XCTFail("\(menuIdentifier) menüsünde hiç hücre bulunamadı.")
    //                return
    //            }
    //
    //            for index in 0..<cells.count {
    //                let cell = cells.element(boundBy: index)
    //
    //
    //                if !cell.waitForExistence(timeout: 20) {
    //                    XCTFail("\(menuIdentifier) menüsündeki hücre \(index) bulunamadı.")
    //                    return
    //                }
    //                cell.tap()
    //
    //
    //                let detailPageTitle: XCUIElement
    //                if menuIdentifier == "Script" {
    //                    detailPageTitle = app.staticTexts["ScriptMainDetailVC"]
    //                } else if menuIdentifier == "Deploy" {
    //                    detailPageTitle = app.staticTexts["DeployDetailMainVC"]
    //                } else {
    //                    XCTFail("Beklenmeyen menü: \(menuIdentifier)")
    //                    continue
    //                }
    //
    //                if !detailPageTitle.waitForExistence(timeout: 30) {
    //                    XCTFail("\(menuIdentifier) menüsündeki hücre \(index) için detay sayfası başlığı bulunamadı.")
    //                    return
    //                }
    //
    //
    //                let backButton = app.buttons["backButtonIdentifier"]
    //                if !backButton.waitForExistence(timeout: 20) {
    //                    XCTFail("\(menuIdentifier) menüsündeki hücre \(index) için geri düğmesi bulunamadı.")
    //                    // Screenshot alarak daha detaylı bir hata raporu sağlayın
    //                    let screenshot = app.screenshot()
    //                    let attachment = XCTAttachment(screenshot: screenshot)
    //                    attachment.lifetime = .keepAlways
    //                    add(attachment)
    //                    return
    //                }
    //                backButton.tap()
    //            }
    //        }
    //    }
    
    
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

     
        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.waitForExistence(timeout: 5))
        usernameTextField.tap()
        usernameTextField.typeText("Pelin")

        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 5))
        passwordTextField.tap()
        passwordTextField.typeText("12345")

        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.waitForExistence(timeout: 10))
        loginButton.tap()

        
        let logTabBarButton = app.tabBars["Tab Bar"].buttons["Log"]
        XCTAssertTrue(logTabBarButton.waitForExistence(timeout: 20))
        logTabBarButton.tap()

       
        let logExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: logTabBarButton)
        XCTAssertEqual(XCTWaiter().wait(for: [logExpectation], timeout: 10), .completed)

        
        let deployTabBarButton = app.tabBars["Tab Bar"].buttons["Deploy"]
        XCTAssertTrue(deployTabBarButton.waitForExistence(timeout: 20))
        deployTabBarButton.tap()

        let deployTableView = app.tables.firstMatch
        XCTAssertTrue(deployTableView.waitForExistence(timeout: 20))
        let deployCells = deployTableView.cells
        XCTAssertGreaterThan(deployCells.count, 0)

     
        let deployExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: deployTabBarButton)
        XCTAssertEqual(XCTWaiter().wait(for: [deployExpectation], timeout: 10), .completed)

       
        let scriptTabBarButton = app.tabBars["Tab Bar"].buttons["Script"]
        XCTAssertTrue(scriptTabBarButton.waitForExistence(timeout: 20))
        scriptTabBarButton.tap()

        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.waitForExistence(timeout: 20))
        let cells = tableView.cells
        XCTAssertGreaterThan(cells.count, 0)

 
        let scriptExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == true"), object: scriptTabBarButton)
        XCTAssertEqual(XCTWaiter().wait(for: [scriptExpectation], timeout: 10), .completed)

      
        for index in 0..<cells.count {
            let cell = cells.element(boundBy: index)
            XCTAssertTrue(cell.waitForExistence(timeout: 20))
            cell.tap()

         
            let scriptDetailPageTitle = app.staticTexts["ScriptMainDetailVC"]
            XCTAssertTrue(scriptDetailPageTitle.waitForExistence(timeout: 40))

          
            scriptDetailPageTitle.swipeDown()

           
            let backButton = app.buttons["backButtonIdentifier"]
            XCTAssertTrue(backButton.waitForExistence(timeout: 20))
            backButton.tap()

         
//            sleep(10)
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
                
            }
        }
    }
}

