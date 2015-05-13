//
//  TestAddWorkout.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/5/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import XCTest
import CardioBuddy

class TestAddWorkout: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // Add two new workouts
        let workout1 = Workout(type: "Elliptical", duration: "20", calories: "40", distance: "2", date: NSDate());
        WorkoutList.sharedWorkoutList().append(workout1);
        let workout2 = Workout(type: "Bicycle", duration: "100", calories: "250", distance: "4", date: NSDate());
        WorkoutList.sharedWorkoutList().append(workout2);
        // Check that the size is 2
        XCTAssert(WorkoutList.sharedWorkoutList().size() == 2, "Pass: list has 2 elements");
        // Check that the first workout was added
        XCTAssert(WorkoutList.sharedWorkoutList().workoutAt(0) == workout1, "Pass: workout was added");
        WorkoutList.sharedWorkoutList().removeWorkout(workout2);
        // Check that the workout was removed
        XCTAssert(WorkoutList.sharedWorkoutList().size() == 1, "Pass: list has only 1 element");
        // Check an attribute of the remaining workout
        XCTAssert(WorkoutList.sharedWorkoutList().workoutAt(0).type == "Elliptical", "Pass: workout1 was not removed and it has the type assigned");
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
