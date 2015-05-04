//
//  ViewController.swift
//  HippoBank
//
//  Created by Ivee Mendes Marins on 4/29/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

class VC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView : UITableView!;
    var goals : [Goal]!
    var addGoalItem : UIBarButtonItem!;
    
    required init(coder aDecoder: NSCoder) {
        goals = GoalDAO.sharedInstance.getGoalsArray();
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGoalItem = UIBarButtonItem(image: UIImage(named: "addButton"), style: .Plain, target: self, action: "onAdd:");
        navigationItem.rightBarButtonItem = addGoalItem;
        navigationItem.leftBarButtonItem = editButtonItem();
        
        tableView = UITableView(frame: view.frame);
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.backgroundColor = UIColor.UIColorFromRGB(0x1bb478);
        view.addSubview(tableView);
    }
    
    func onAdd(sender: AnyObject) {
        println("criou");
        
        var addGoal = AddGoalVC();
        addGoal.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;
        presentViewController(addGoal, animated: true, completion: nil);
        
//        var goal : Goal = Goal(name: "Xbox 360", price: 100004.00, moneySaved: 20000.00, priority: 0, categoryType: CategoryType.Cars);
//        
//        GoalDAO.sharedInstance.saveGoal(goal)
//        
//        goals = GoalDAO.sharedInstance.getGoalsArray();
//        tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            GoalDAO.sharedInstance.deleteGoal(goals[indexPath.row].id);
            goals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated);
        tableView.setEditing(editing, animated: animated);
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if(tableView.editing == true){
            return UITableViewCellEditingStyle.Delete
        }
        return UITableViewCellEditingStyle.None;
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return view.frame.height/3.5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var goalCell : GoalCell = GoalCell(view: view);

        goalCell.labelName.text = goals[indexPath.row].name.capitalizedString;
        goalCell.labelTotalPrice.text = NSString(format:"R$ %.2f", goals[indexPath.row].price) as String;
        goalCell.labelMoneySaved.text = NSString(format:"R$ %.2f", goals[indexPath.row].moneySaved) as String;
        goalCell.labelCategory.text = goals[indexPath.row].categoryType.description;
        goalCell.categoryImage.image = UIImage(named: CategoryType.getCategoryImage(goals[indexPath.row].categoryType.description));
        
        var priority = goals[indexPath.row].priority;
        
        if (priority == 0){
            goalCell.imagePriorityLow.hidden = false;
        }else if (priority == 1){
            goalCell.imagePriorityLow.hidden = false;
            goalCell.imagePriorityMedium.hidden = false;
        }else{
            goalCell.imagePriorityLow.hidden = false;
            goalCell.imagePriorityMedium.hidden = false;
            goalCell.imagePriorityHigh.hidden = false;
        }
        
        return goalCell;
    }

}
