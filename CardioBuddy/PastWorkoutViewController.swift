//
//  PastWorkoutViewController.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/20/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class PastWorkoutViewController: UIViewController {

    @IBOutlet var typeLabel: UILabel!;
    @IBOutlet var durLabel: UILabel!;
    @IBOutlet var calLabel: UILabel!;
    @IBOutlet var disLabel: UILabel!;
    
    var workout: Workout?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelsForWorkout();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    func setWorkoutTo(w: Workout) {
        workout = w;
    }
    
    func setLabelsForWorkout() {
        if let w = workout {
            typeLabel.text = w.type;
            durLabel.text = w.duration;
            calLabel.text = w.calories;
            disLabel.text = w.distance;
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
