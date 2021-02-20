//
//  Bundle+ExtTests.swift
//  HeroCommonsTests
//
//  Created by Horacio Guzman on 19/02/21.
//

import XCTest

class Bundle_ExtTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_loadJSONFromBundle() {
        // Given
        let fileName = "jsonTestFile"
        let bundle = Bundle(for: Bundle_ExtTests.self)
        // When
        let data = bundle.readLocalJSONFile(fileName)!
        // Then
        let dictionary = try! JSONDecoder().decode([String: String].self, from: data)
        XCTAssertEqual("Test", dictionary["TestKey"], "The values must be the same")
    }
    
    func test_loadJSONFromBundle_NoFile() {
        // Given
        let fileName = "jsonTestFile2"
        let bundle = Bundle(for: Bundle_ExtTests.self)
        // When
        let data = bundle.readLocalJSONFile(fileName)
        // Then
        XCTAssertNil(data, "There is not file called \(fileName)")
    }
}
