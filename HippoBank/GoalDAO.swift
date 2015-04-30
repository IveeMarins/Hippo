//
//  GoalDAO.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 4/30/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

private let _goalDao = GoalDAO()

class GoalDAO {
   
    class var sharedInstance: GoalDAO {
        return _goalDao
    }
    
    private init() {
    }
    
    func searchGoals() -> [Goal]{
        
        
    }
    
    
    func saveGoal(goal: Goal) -> Goal?{
        
        let savedInformation = NSUserDefaults.standardUserDefaults()
        savedInformation.setObject(goal, forKey: "GOAL_\(goal.id)")
        
        
    }
    
    func updateGoal(goal: Goal,value: Float){
        
        goal.moneySaved += value
    
    }
    
    func deleteGoal(id: Int) -> Goal?{
        
        
        
    }
}
