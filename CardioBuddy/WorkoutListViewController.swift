//
//  WorkoutListViewController.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/16/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class WorkoutListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!;
    var workoutToAdd: Workout? = nil;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let workoutList = WorkoutList.sharedWorkoutList();
    
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        if let w = workoutToAdd {
            
            addWorkout(w);
            
            if let newItemIndex = find(WorkoutList.sharedWorkoutList().getList(), w) {
                let newProjectIndexPath = NSIndexPath(forRow: newItemIndex, inSection: 0)
                tableView.insertRowsAtIndexPaths([newProjectIndexPath], withRowAnimation: .Automatic)
            }
            
            workoutToAdd = nil;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addWorkout(workout: Workout) {
        WorkoutList.sharedWorkoutList().append(workout);
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return WorkoutList.sharedWorkoutList().size();
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var opCell = tableView.dequeueReusableCellWithIdentifier("Workout") as? UITableViewCell
        
        if let cell = opCell {
            cell.textLabel!.text = WorkoutList.sharedWorkoutList().workoutAt(indexPath.row).type;
            
            let date = WorkoutList.sharedWorkoutList().workoutAt(indexPath.row).date;
            var dateFormatter = NSDateFormatter();
            dateFormatter.timeStyle = .NoStyle
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            let dateString = dateFormatter.stringFromDate(date);
            
            cell.detailTextLabel!.text = dateString;
            
            cell.selectionStyle = .None;
            
            return cell
        } else {
            return UITableViewCell();
        }
    
    }
    
    /*func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        
        return "Past Workouts";
    }*/
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let cell = sender as? UITableViewCell {
            if let pwvc = segue.destinationViewController as? PastWorkoutViewController {
                if let index = tableView.indexPathForCell(cell)?.row {
                    pwvc.setWorkoutTo(WorkoutList.sharedWorkoutList().workoutAt(index));
                }
            }
        }
    }
}
