//
//  TestValuesArray.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/12/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest

class TestValuesArray: XCTestCase {

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
        var values0 = [Float(1.0), Float(2.1), Float(6.2), Float(1.0), Float(2.1), Float(6.2), Float(1.0), Float(2.1), Float(6.2), Float(1.9), Float(2.1), Float(6.2)];
        //XCTAssertThrows(setValues(values0), "Pass")
        var setValues0 = setValues(values0);
        for i in 0..<setValues0.count {
            XCTAssert(setValues0[i] != nil, "Pass : all strings");
        }
        var values1 = [Float(42.2), Float(2.1), Float(6.2), Float(1.0)];
        //XCTAssertThrows(setValues(values1), "Pass")
        var setValues1 = setValues(values1);
        for i in 0..<setValues1.count {
            XCTAssert(setValues1[i] != nil, "Pass : all strings");
        }
        var values2 = [Float(1.0), Float(2.1), Float(6.2), Float(1.0), Float(2.1), Float(6.2), Float(1.0), Float(2.1), Float(6.2), Float(1.9), Float(2.1), Float(6.2), Float(5.2), Float(5.6)];
        //XCTAssertThrows(setValues(values2), "Pass")
        var setValues2 = setValues(values2);
        for i in 0..<setValues2.count {
            XCTAssert(setValues2[i] != nil, "Pass : all strings");
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func setValues(values: [Float]) -> [String?] {
        var array = [String?](count: 12, repeatedValue: nil);
        var c = values.count;
        if (c > array.count) {
            c = array.count
        }
        for i in 0..<c {
            if (i % 3 == 2) {
                array[i] = NSString(format: "%.1f", values[i]) as? String;
            } else {
                array[i] = NSString(format: "%.0f", values[i]) as? String;
            }
        }
        return array;
    }

}
