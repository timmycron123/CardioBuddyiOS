//
//  CardioBuddyTests.swift
//  CardioBuddyTests
//
//  Created by Tim Cronshaw on 3/10/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest
import CardioBuddy

class CardioBuddyTests: XCTestCase {
    
    var workoutList1: WorkoutList?
    var workoutList2: WorkoutList?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        workoutList1 = WorkoutList.sharedWorkoutList();
        workoutList2 = WorkoutList.sharedWorkoutList();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        
        XCTAssert(workoutList1 == workoutList2, "Workout List is returning the same instance")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
