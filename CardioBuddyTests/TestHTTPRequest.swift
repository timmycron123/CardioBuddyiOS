//
//  TestHTTPRequest.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/5/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest

class TestHTTPRequest: XCTestCase {

    let url = "http://ip.jsontest.com";

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
        if let nsurl = NSURL(string: url) {
            HTTPHelper.loadDataFromURL(nsurl, completion: { (data: NSData?, error: NSError?) -> Void in
                XCTAssert(data != nil, "Pass: data is fetched");
                let json: AnyObject? = HTTPHelper.parseJSONFromData(data!);
                XCTAssert(json != nil, "Pass: json is parsed");
                let dict: NSDictionary? = json as? NSDictionary;
                XCTAssert(dict != nil, "Pass: json is dictionary");
                let string: String? = dict!.valueForKey("ip") as? String;
                XCTAssert(string != nil, "Pass: dictionary value not nil");
                XCTAssert(string! == "209.129.49.231", "Pass: dictionary contains valid string");
                println("This is the ip: " + string!);
            });
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
