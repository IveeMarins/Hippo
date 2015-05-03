//
//  ViewController.swift
//  HippoBank
//
//  Created by Ivee Mendes Marins on 4/29/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        view.addSubview(tableView);
    }
    
    func onAdd(sender: AnyObject) {
        println("criou");
        var goal : Goal = Goal(name: "teste", price: 124.00, moneySaved: 20, priority: 1, categoryType: CategoryType.Clothes);
        
        GoalDAO.sharedInstance.saveGoal(goal)
        
        goals = GoalDAO.sharedInstance.getGoalsArray();
        tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        
        return true
    }
    
    //editar a tela de tarefas
    
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
        
        println("HOHO");
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
        return view.frame.height/4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell = UITableViewCell(frame: view.frame);
        
        //criamos o label por código com suas propriedades
        var label = UILabel(frame: CGRectMake(0,0, view.frame.width, cell.frame.height));
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        label.textAlignment = NSTextAlignment.Center;
        label.text = goals[indexPath.row].name;
        
        cell.addSubview(label);
        
        return cell;
    }


}

