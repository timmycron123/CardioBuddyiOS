//
//  TestStringCheck.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/12/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest

class TestStringCheck: XCTestCase {

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
        XCTAssert(textIsFloat("timIsNotAFloat") == false, "Passed: false");
        XCTAssert(textIsFloat("0.00422") == true, "Passed: true");
        XCTAssert(textIsFloat("1.242") == true, "Passed: true");
        XCTAssert(textIsFloat("1234.24281") == true, "Passed: true");
        XCTAssert(textIsFloat("0.sdljfs") == false, "Passed: false");
        XCTAssert(textIsFloat("tim.123") == false, "Passed: false");
        XCTAssert(textIsFloat("23.536.36.64") == false, "Passed: false");
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    func textIsFloat(text: String) -> Bool {
        let splitText = split(text) {$0 == "."};
        if (text as NSString).floatValue == 0 || splitText.count > 2 {
            return false;
        }
        return true;
    }
}
