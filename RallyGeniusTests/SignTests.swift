//
//  SignTests.swift
//  RallyGenius
//
//  Created by Barry Bryant on 4/5/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import XCTest


class SignTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidNoviceSignCreation() {
        let sign = Sign(signNumber: 12, description: "Sup")
        XCTAssert(sign.getClass() == .novice)
    }
    
    func testValidIntermediateAndAdvancedSignCreation() {
        let sign = Sign(signNumber: 112, description: "Sup")
        XCTAssert(sign.getClass() == .intermediateAndAdvanced)
    }
    
    func testValidExcellentSignCreation() {
        let sign = Sign(signNumber: 212, description: "Sup")
        XCTAssert(sign.getClass() == .excellent)
    }
    
    func testValidMasterSignCreation() {
        let sign = Sign(signNumber: 312, description: "Sup")
        XCTAssert(sign.getClass() == .master)
    }
    
    func testErroneusNegativeSignCreation() {
        let sign = Sign(signNumber: -15, description: "Sup")
        XCTAssert(sign.getClass() == .error)
    }
    
    func testErroneusLargeSignCreation() {
        let sign = Sign(signNumber: 999, description: "Sup")
        XCTAssert(sign.getClass() == .error)
    }
    
    
}
