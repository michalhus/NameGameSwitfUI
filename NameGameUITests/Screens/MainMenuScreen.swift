//
//  MainScreen.swift
//  NameGameUITests
//
//  Created by Michal Hus on 11/5/20.
//

import XCTest

class MainScreen: BaseScreen {
    
    // MARK: Images
    var gameIconImage: XCUIElement {
        return app.images["game-icon"].firstMatch
    }
    
    // MARK: Text
    var introMessageStaticText: XCUIElement {
        return app.staticTexts["intro-message-text"].firstMatch
    }
    
    // MARK: Buttons
    var practiceModeButton: XCUIElement {
        return app.buttons["practice-mode-button"].firstMatch
    }
    
    var timedModeButton: XCUIElement {
        return app.buttons["timed-mode-button"].firstMatch
    }
    
}
