//
//  NameGameTests.swift
//  NameGameTests
//
//  Created by Michal Hus on 10/31/20.
//

import XCTest
@testable import NameGame

class NameGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProfile() throws {
        
        let url = Headshot(url: "\\google.com")
        let profileResponseStub = ProfileResponse(firstName: "Mike", lastName: "Waga", headshot: url)
        let profileViewModelStub = ProfileViewModel(profile: profileResponseStub)

        XCTAssertEqual(profileViewModelStub.name, "Mike Waga")
        XCTAssertEqual(profileViewModelStub.headshot, "https:\\google.com")
    }
    
}
