//
//  TaskView.swift
//  EduOrganizer
//
//  Created by Haroldo Olivieri on 3/23/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class ListGoalView : UIView {
    
    var tableView : UITableView!;
    var emptyView : UIView!;
    var imageEmpty : UIImageView!;
    var labelEmpty : UILabel!;
    
    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame);
        
        frame = view.frame;
        
        parent.title = "Goals";
        
        var width  = frame.width;
        var height  = frame.height;
        
        emptyView = UIView(frame: view.frame);
        imageEmpty = UIImageView(frame: CGRectMake(width * 0.15, height*0.5,width * 0.7,height * 0.4));
        imageEmpty.image = UIImage(named: "hippoEmptyList");
        imageEmpty.contentMode = UIViewContentMode.ScaleAspectFit;
        
        labelEmpty = UILabel(frame: CGRectMake(width * 0.2,height*0.4,width*0.6,height * 0.2));
        labelEmpty.text = "Add a new Goal!"
        labelEmpty.textAlignment = NSTextAlignment.Center;
        labelEmpty.textColor = UIColor.whiteColor();
        labelEmpty.font = UIFont(name: "AvenirNext-Medium", size: 20)
    
        emptyView.addSubview(imageEmpty);
        emptyView.addSubview(labelEmpty);
        
        emptyView.hidden = true;
        
        tableView = UITableView(frame: view.frame);
        tableView.backgroundColor = UIColor.UIColorFromRGB(0x1bb478);
        view.backgroundColor = UIColor.UIColorFromRGB(0x1bb478);

        view.addSubview(tableView);
        view.addSubview(emptyView);

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}