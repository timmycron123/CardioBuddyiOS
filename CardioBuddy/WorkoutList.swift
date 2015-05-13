//
//  WorkoutList.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/20/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import Foundation

let _sharedWorkoutList : WorkoutList = { WorkoutList() }();

class WorkoutList: NSObject {
    
    var list: [Workout];
   
    class func sharedWorkoutList() -> WorkoutList {
        return _sharedWorkoutList;
    }
    
    override init() {
        list = ParseHelper.retrieveWorkouts();
    }
    
    func getList() -> [Workout] {
        return list;
    }
    
    func workoutAt(index: Int) -> Workout {
        return list[index];
    }
    
    func append(workout: Workout) {
        ParseHelper.saveWorkout(workout);
        list.append(workout);
    }
    
    func remove(index: Int) {
        list.removeAtIndex(index);
    }
    
    func removeWorkout(workout: Workout) {
        for i in 0..<list.count {
            if (list[i] == workout) {
                list.removeAtIndex(i);
            }
        }
    }
    
    func size() -> Int {
        return list.count;
    }
    
    func totalForType(type: String, andStat stat: String) -> Float {
        var total = Float(0);
        for i in 0..<list.count {
            if (list[i].type == type) {
                total = total + (list[i].getStat(stat));
            }
        }
        return total;
    }
    
    func averageForType(type: String, andStat stat: String) -> Float {
        let size = sizeOfType(type);
        if (size == 0) {
            return Float(0);
        } else {
            return totalForType(type, andStat: stat)/Float(sizeOfType(type));
        }
    }
    
    func sizeOfType(type: String) -> Int {
        var size = 0;
        for i in 0..<list.count {
            if (list[i].type == type) {
                size++;
            }
        }
        return size;
    }
}
