//
//  NameGameUIBaseTests.swift
//  NameGameUIBaseTests
//
//  Created by Michal Hus on 11/5/20.
//

import XCTest

class NameGameUIBaseTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
