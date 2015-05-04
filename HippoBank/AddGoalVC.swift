//
//  AddGoal.swift
//  HippoBank
//
//  Created by Haroldo Olivieri on 5/4/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//
import UIKit

class AddGoalVC : UIViewController{
    
    var addView : AddGoalView!;
    
    //IR PARA PARTE DE VIEW
    override func viewDidLoad(){
        addView = AddGoalView(view: view, parent: self);
        
        addView.cancelButton.addTarget(self, action: "cancelAction:", forControlEvents: UIControlEvents.TouchUpInside)
        addView.saveButton.addTarget(self, action: "saveAction:", forControlEvents: UIControlEvents.TouchUpInside)
        addView.dismissButton.addTarget(self, action: "dismiss:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func dismiss (sender: UIButton){
        println("dismiss")
        dismissViewControllerAnimated(true, completion: nil)
    }
}