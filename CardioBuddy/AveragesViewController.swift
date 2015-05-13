//
//  FirstViewController.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/10/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class AveragesViewController: UIViewController {
    
    @IBOutlet var totalsView: DataTableView!;
    @IBOutlet var averagesView: DataTableView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        var totals = getTotals();
        var averages = getAverages();
        
        //let interval = calculateInterval(totals + averages, duration: 1.0);
        
        //totalsView.countToValues(totals, interval: interval);
        //averagesView.countToValues(averages, interval: interval);
        
        totalsView.setValues(totals);
        averagesView.setValues(averages);
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated);
        
        //totalsView.resetToZero();
        //averagesView.resetToZero();
    }
    
    func getTotals() -> [Float] {
        
        var totals = Array(count: 12, repeatedValue: Float(0));
        
        let workouts = WorkoutList.sharedWorkoutList();
        
        totals[0] = workouts.totalForType("Treadmill", andStat: "duration");
        totals[1] = workouts.totalForType("Treadmill", andStat: "calories");
        totals[2] = workouts.totalForType("Treadmill", andStat: "distance");
        totals[3] = workouts.totalForType("Stationary Bike", andStat: "duration");
        totals[4] = workouts.totalForType("Stationary Bike", andStat: "calories");
        totals[5] = workouts.totalForType("Stationary Bike", andStat: "distance");
        totals[6] = workouts.totalForType("Elliptical", andStat: "duration");
        totals[7] = workouts.totalForType("Elliptical", andStat: "calories");
        totals[8] = workouts.totalForType("Elliptical", andStat: "distance");
        totals[9] = workouts.totalForType("Stair Climber", andStat: "duration");
        totals[10] = workouts.totalForType("Stair Climber", andStat: "calories");
        totals[11] = workouts.totalForType("Stair Climber", andStat: "distance");
        
        return totals;
    }
    
    func getAverages() -> [Float] {
        
        var averages = Array(count: 12, repeatedValue: Float(0));
        
        let workouts = WorkoutList.sharedWorkoutList();
        
        averages[0] = workouts.averageForType("Treadmill", andStat: "duration");
        averages[1] = workouts.averageForType("Treadmill", andStat: "calories");
        averages[2] = workouts.averageForType("Treadmill", andStat: "distance");
        averages[3] = workouts.averageForType("Stationary Bike", andStat: "duration");
        averages[4] = workouts.averageForType("Stationary Bike", andStat: "calories");
        averages[5] = workouts.averageForType("Stationary Bike", andStat: "distance");
        averages[6] = workouts.averageForType("Elliptical", andStat: "duration");
        averages[7] = workouts.averageForType("Elliptical", andStat: "calories");
        averages[8] = workouts.averageForType("Elliptical", andStat: "distance");
        averages[9] = workouts.averageForType("Stair Climber", andStat: "duration");
        averages[10] = workouts.averageForType("Stair Climber", andStat: "calories");
        averages[11] = workouts.averageForType("Stair Climber", andStat: "distance");
        
        return averages;
    }
    
    func calculateInterval(values:[Int], duration:Float) -> Double {
        
        var maxEnd = values[0];
        
        for i in 1..<values.count {
            if (values[i] > maxEnd) {
                maxEnd = values[i];
            }
        }
        
        var interval = Double(0);
        
        if (maxEnd != 0) {
            
            interval = Double(duration / Float(maxEnd));
            if interval < 0.01 {
                interval = 0.01;
            } else if interval > 0.1 {
                interval = 0.1;
            }
        }
        return interval;
    }
}

