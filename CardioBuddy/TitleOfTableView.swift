//
//  TitleOfTableView.swift
//  CardioBuddy
//
//  Created by Tim Cronshaw on 3/20/15.
//  Copyright (c) 2015 Tim Cronshaw. All rights reserved.
//

import UIKit

class TitleOfTableView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        let fHeight = self.bounds.size.height;
        let fWidth = self.bounds.size.width;
        
        let wUnit = fWidth/4;
        let hUnit = fHeight;
        
        var x = CGFloat(0);
        var y = CGFloat(0);
        var text = "";
        
        for i in 0..<3 {
            let floati = CGFloat(i);
            x = (1+floati)*wUnit;
            switch i {
            case 0:
                text = "Minutes";
            case 1:
                text = "Calories";
            case 2:
                text = "Miles";
            default:
                text = "";
            }
            
            var label = UILabel(frame: CGRectMake(x, y, wUnit, hUnit));
            label.text = text;
            label.textAlignment = NSTextAlignment.Center;
            // font size
            // vertical alignment
            addSubview(label);
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
