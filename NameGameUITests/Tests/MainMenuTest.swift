//
//  MainMenuTest.swift
//  NameGameUITests
//
//  Created by Michal Hus on 11/5/20.
//

import XCTest

class MainMenuTest: NameGameUIBaseTests {
    
    let mainScreen = MainScreen()
    
    func test_MainScreenElementExistence() {
        
        XCTAssert(mainScreen.gameIconImage.waitForExistence(timeout: 20), "Element \(mainScreen.gameIconImage) DOES NOT exists")
        XCTAssert(mainScreen.introMessageStaticText.waitForExistence(timeout: 20), "Element \(mainScreen.introMessageStaticText) DOES NOT exists")
        XCTAssert(mainScreen.practiceModeButton.waitForExistence(timeout: 20), "Element \(mainScreen.practiceModeButton) DOES NOT exists")
        XCTAssert(mainScreen.timedModeButton.waitForExistence(timeout: 20), "Element \(mainScreen.timedModeButton) DOES NOT exists")
    }
    
    func test_MainScreenButtonsState() {
        
        XCTAssert(mainScreen.practiceModeButton.waitForExistence(timeout: 20), "Element \(mainScreen.practiceModeButton) DOES NOT exists")
        XCTAssert(mainScreen.timedModeButton.waitForExistence(timeout: 20), "Element \(mainScreen.timedModeButton) DOES NOT exists")
        
        XCTAssert(mainScreen.practiceModeButton.isHittable, "Element \(mainScreen.practiceModeButton) IS NOT hittable")
        XCTAssert(mainScreen.timedModeButton.isHittable, "Element \(mainScreen.timedModeButton) IS NOT hittable")
        
        mainScreen.timedModeButton.tap()
        
    }

    
}
