//
//  TestStringToInt.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/12/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest

class TestStringToInt: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(textIsInt("1232"), "Pass: true");
        XCTAssert(textIsInt("29"), "Pass: true");
        XCTAssert(!textIsInt("tim"), "Pass: false");
        XCTAssert(!textIsInt("1232.2232"), "Pass: true");
        XCTAssert(!textIsInt("tim.tim1232"), "Pass: true");
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func textIsInt(text: String) -> Bool {
        if let textNum = text.toInt() {
            return true;
        }
        return false;
    }

}
