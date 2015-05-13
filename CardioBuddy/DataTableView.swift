//
//  DataTableView.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/17/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class DataTableView: UIView {
    
    let dataArray: [Int]?;
    var labels: [UILabel];
    
    var curValues: [Int];
    var endValues: [Int];
    
    var timer: NSTimer?;

    required init(coder aDecoder: NSCoder) {
        
        curValues = Array(count: 12, repeatedValue: 0);
        endValues = Array(count: 12, repeatedValue: 0);
        
        labels = [UILabel]();
        
        dataArray = nil;
        
        super.init(coder: aDecoder);
        
        let fHeight = self.bounds.size.height;
        let fWidth = self.bounds.size.width;
        
        let wUnit = fWidth/4;
        let hUnit = fHeight/4;
        
        var x = CGFloat(0);
        var y = CGFloat(0);
        var text = "";
        
        for i in 0..<4 {
            let floati = CGFloat(i);
            y = floati * hUnit;
            switch i {
            case 0:
                text = "Treadmill";
            case 1:
                text = "Bicycle";
            case 2:
                text = "Elliptical";
            case 3:
                text = "Climber";
            default:
                text = "";
            }
            
            var label = UILabel(frame: CGRectMake(x, y, wUnit, hUnit));
            label.text = text;
            label.textAlignment = NSTextAlignment.Right;
            // alignment
            // font size
            // vertical alignment
            addSubview(label);
        }
        
        var row = 0;
        var col = 0;
        
        text = "0";
        
        for i in 0..<12 {
            
            text = "0";
            
            col = i % 3;
            if (i % 3 == 0 && i > 0) {
                row++;
            }
            
            x = wUnit * CGFloat(col+1);
            y = hUnit * CGFloat(row);
            
            var label = UILabel(frame: CGRectMake(x, y, wUnit, hUnit));
            label.text = text;
            label.textAlignment = NSTextAlignment.Center;
            labels.append(label);
            addSubview(label);
        }
        
        let list = WorkoutList.sharedWorkoutList();
    }
    
    func updateValues(timer:NSTimer) {
        
        var finished = true;
        
        for i in 0..<12 {
            
            if (curValues[i] < endValues[i]) {
                curValues[i]++;
                
                labels[i].text = String(curValues[i]);
                finished = false;
            }
        }
        
        if (finished && self.timer != nil) {
            self.timer?.invalidate();
            self.timer = nil;
        }
    }
    
    func countToValues(values:[Int], interval:Double) {
        
        endValues = values;
        
        if timer != nil {
            timer?.invalidate();
            timer = nil;
        }
            
        timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "updateValues:", userInfo: nil, repeats: true);
    }
    
    func setValues(values: [Float]) {
        for i in 0..<12 {
            if (i % 3 == 2) {
                labels[i].text = NSString(format: "%.1f", values[i]) as String;
            } else {
                labels[i].text = NSString(format: "%.0f", values[i]) as String;
            }
        }
    }
    
    func resetToZero() {
        for i in 0..<12 {
            labels[i].text = "0";
            endValues[i] = 0;
            curValues[i] = 0;
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
