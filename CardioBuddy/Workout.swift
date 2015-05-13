//
//  Workout.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/16/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class Workout: NSObject {
    
    var type: String;
    var duration: String;
    var calories: String;
    var distance: String;
    var date: NSDate;
    
    init(type: String, duration: String, calories: String, distance: String, date: NSDate) {
        self.type = type;
        self.duration = duration;
        self.calories = calories;
        self.distance = distance;
        self.date = date;
    }
    
    func getStat(stat: String) -> Float {
        if (stat == "duration") {
            return (duration as NSString).floatValue;
        } else if (stat == "calories") {
            return (calories as NSString).floatValue;
        } else if (stat == "distance"){
            return (distance as NSString).floatValue;
        } else {
            return Float(0);
        }
    }
}
