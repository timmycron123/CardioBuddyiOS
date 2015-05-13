//
//  SecondViewController.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/10/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class NewWorkoutViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var typeSelect: UIPickerView!
    @IBOutlet var durInput: UITextField!
    @IBOutlet var calInput: UITextField!
    @IBOutlet var disInput: UITextField!
    var newWorkout = Workout(type: "Treadmill", duration: "0", calories: "0", distance: "0", date: NSDate())
    let typeData = ["Treadmill", "Stair Climber", "Stationary Bike", "Elliptical"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        typeSelect.dataSource = self;
        typeSelect.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        durInput.text = "0 min";
        calInput.text = "0 cal";
        disInput.text = "0.0 mi";
    }
    
    func saveWorkoutWithNC(nc: UINavigationController, andTBC tbc: UITabBarController) {
        if let wlvc = nc.topViewController as? WorkoutListViewController {
            wlvc.workoutToAdd = newWorkout;
            tbc.selectedIndex = 0;
        } else {
            nc.popViewControllerAnimated(false);
            saveWorkoutWithNC(nc, andTBC: tbc);
        }
    }
    
    @IBAction func saveNewWorkout(sender: AnyObject) {
        let type = typeData[typeSelect.selectedRowInComponent(0)];
        let dur = durInput.text.componentsSeparatedByString(" ")[0];
        let cal = calInput.text.componentsSeparatedByString(" ")[0];
        let dis = disInput.text.componentsSeparatedByString(" ")[0];
        let date = NSDate();
        
        if let d = dur.toInt() {
            if let c = cal.toInt() {
                if let d2 = (NSString(format: "%.1f", dis) as? String) {
                    newWorkout = Workout(type: type, duration: dur, calories: cal, distance: dis, date: date);
                    
                    //WorkoutList.sharedWorkoutList().append(newWorkout);
                    if let tbc = tabBarController {
                        if let vcs = tbc.viewControllers {
                            if let nc = vcs[0] as? UINavigationController {
                                saveWorkoutWithNC(nc, andTBC: tbc);
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func segmentChanged (sender: UISegmentedControl) {
    }
    
    // MARK: - ViewTapped
    @IBAction func viewTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin = CGPointMake(0, -60)
            }, completion: nil)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin = CGPointMake(0, 0);
            }, completion: nil)
        if (textField == disInput) {
            let fv = (textField.text as NSString).floatValue
            textField.text = (NSString(format: "%.1f", fv) as String) + " mi";
            return;
        }
        if let textNum = textField.text.toInt() {
            if (textField == durInput) {
                textField.text = textField.text + " min"
            } else if (textField == calInput) {
                textField.text = textField.text + " cal"
            }
        } else {
            if (textField.text != "") {
                println("error");
            }
            if (textField == durInput) {
                textField.text = "0 min"
            } else if (textField == calInput) {
                textField.text = "0 cal"
            } else if (textField == disInput) {
                textField.text = "0.0 mi"
            }
        }
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return typeData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }*/
}