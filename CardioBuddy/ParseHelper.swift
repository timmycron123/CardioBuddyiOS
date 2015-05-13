//
//  ParseHelper.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/12/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit
import Parse

class ParseHelper {
   
    class func saveWorkout(workout: Workout) {
        var pfWorkout = PFObject(className: "Workout");
        pfWorkout["type"] = workout.type;
        pfWorkout["distance"] = workout.distance;
        pfWorkout["calories"] = workout.calories;
        pfWorkout["duration"] = workout.duration;
        
        var dateFormatter = NSDateFormatter();
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.stringFromDate(workout.date);
        
        pfWorkout["date"] = dateString;
        pfWorkout.pinInBackground();
    }
    
    class func retrieveWorkouts() -> [Workout] {
        var workouts = [Workout]();
        let query = PFQuery(className: "Workout");
        var dateFormatter = NSDateFormatter();
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateFormat = "MM/dd/yyyy"
        query.fromLocalDatastore();
        if let pfWorkouts = query.findObjects() {
            for i in 0..<pfWorkouts.count {
                if let pfw = pfWorkouts[i] as? PFObject {
                    let type = pfw["type"] as? String;
                    let duration = pfw["duration"] as? String;
                    let distance = pfw["distance"] as? String;
                    let calories = pfw["calories"] as? String;
                    let dateString = pfw["date"] as? String;
                    let date = dateFormatter.dateFromString(dateString!);
                    if (type != nil && duration != nil && distance != nil && calories != nil && date != nil) {
                        var w = Workout(type: type!, duration: duration!, calories: calories!, distance: distance!, date: date!);
                        workouts.append(w);
                    }
                }
            }
        }
        return workouts;
    }
}
