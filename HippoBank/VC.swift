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
    var listGoalView : ListGoalView!;
    
    required init(coder aDecoder: NSCoder) {
        goals = GoalDAO.sharedInstance.getGoalsArray();
        super.init(coder: aDecoder);
    }
    
    func refresh(notification: NSNotification){
        goals = GoalDAO.sharedInstance.getGoalsArray();
        listGoalView.tableView.reloadData();
    }
    
    
    func youDidIt(notification: NSNotification){
        println("did It");
        
        var completeVC = CompleteVC();
        completeVC.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;
        presentViewController(completeVC, animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refresh:", name:"addedGoal", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "youDidIt:", name:"didIt",
            object: nil)
        
        listGoalView = ListGoalView(view: view, parent: self);
        addGoalItem = UIBarButtonItem(image: UIImage(named: "addButton"), style: .Plain, target: self, action: "onAdd:");
        navigationItem.rightBarButtonItem = addGoalItem;
        navigationItem.leftBarButtonItem = editButtonItem();
        
        listGoalView.tableView.dataSource = self;
        listGoalView.tableView.delegate = self;
    }
    
    func onAdd(sender: AnyObject) {
        
        var addGoal = AddGoalVC();
        addGoal.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;
        presentViewController(addGoal, animated: true, completion: nil);

        goals = GoalDAO.sharedInstance.getGoalsArray();
        

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
        listGoalView.tableView.setEditing(editing, animated: animated);
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
        if (goals.count == 0){
            listGoalView.emptyView.hidden = false;
            listGoalView.tableView.hidden = true;
        }else{
            listGoalView.emptyView.hidden = true;
            listGoalView.tableView.hidden = false;
        }
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
        goalCell.categoryImage.image = UIImage(named: CategoryType.getCategoryImage(goals[indexPath.row].categoryType.description));
        
        var priority = goals[indexPath.row].priority;
        
        if (priority == 1){
            goalCell.imagePriorityLow.hidden = false;
        }else if (priority == 2){
            goalCell.imagePriorityLow.hidden = false;
            goalCell.imagePriorityMedium.hidden = false;
        }else{
            goalCell.imagePriorityLow.hidden = false;
            goalCell.imagePriorityMedium.hidden = false;
            goalCell.imagePriorityHigh.hidden = false;
        }
        
        return goalCell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var addGoal = AddGoalVC();
        addGoal.goal = GoalDAO.sharedInstance.getGoalById(indexPath.row)
        
        addGoal.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;
        presentViewController(addGoal, animated: true, completion: nil);
        
        listGoalView.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}

