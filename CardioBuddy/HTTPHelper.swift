//
//  HTTPHelper.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 5/2/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import Foundation

class HTTPHelper: NSObject {
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                completion(data: data, error: nil)
            }
        })
        
        loadDataTask.resume()
    }
    
    class func getWorkouts() -> [Workout]? {
        
        var objectFromJSON: AnyObject?;
        
        if let url = NSURL(string: Constants.WORKOUT_URL) {
            loadDataFromURL(url, completion: { (data: NSData?, error: NSError?) -> Void in
                if error == nil && data != nil {
                    objectFromJSON = self.parseJSONFromData(data!);
                } else {
                    // TODO: ERROR
                }
            })
        }
        
        if let dict = objectFromJSON as? NSDictionary {
            return workoutsFromDict(dict);
        } else if let array = objectFromJSON as? [AnyObject] {
            return workoutsFromList(array);
        }
        
        return nil;
    }
    
    class func parseJSONFromData(data: NSData) -> AnyObject? {
        var parseError: NSError?
        if let object: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &parseError) {
            return object;
        } else {
            return nil;
        }
    }
    
    class func workoutsFromDict(dict: NSDictionary) -> [Workout] {
        return [Workout]();
    }
    
    class func workoutsFromList(list: [AnyObject]) -> [Workout] {
        return [Workout]();
    }
}