//
//  Constants.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/2/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import Foundation

struct Constants {
    static let WORKOUT_URL = "INSERT URL HERE";
    static let TYPES = [Type.TREADMILL, Type.ELLIPTICAL, Type.BIKE, Type.STAIRCLIMBER];
    static let STATS = [Stat.DURATION : "min", Stat.CALORIES : "cal", Stat.DISTANCE : "mi"];
}

enum Type: String {
    case TREADMILL = "Treadmill"
    case BIKE = "Stationary Bike"
    case ELLIPTICAL = "Elliptical"
    case STAIRCLIMBER = "Stair Climber"
}

enum Stat: String {
    case DURATION = "Duration"
    case CALORIES = "Calories"
    case DISTANCE = "Distance"
}