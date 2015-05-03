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
    
    let savedInformation = NSUserDefaults.standardUserDefaults()

    private init() {
    }
    
    func getGoalsArray() -> [Goal]{
        
        var goals: [Goal] = []
        var i : Int
        
        var numGoals = self.savedInformation.integerForKey("NUM_GOALS")
        
        if(numGoals > 0){
            for (i = 0; i < numGoals; i++) {
                goals.append(getGoalById(i))
            }
        }
        
        return goals
        
    }
    
    func getGoalById(id : Int) -> Goal{
        
        var goal : Goal = Goal();
        
        goal.name = self.savedInformation.stringForKey("GOAL_NAME_\(id)")!
        goal.price = self.savedInformation.floatForKey("GOAL_PRICE_\(id)")
        goal.moneySaved = self.savedInformation.floatForKey("GOAL_SAVED_\(id)")
        goal.priority = self.savedInformation.integerForKey("GOAL_PRIORITY_\(id)")
        var categoryType = self.savedInformation.stringForKey("GOAL_CATEGORY_\(id)")!
        goal.categoryType = CategoryType.convert(categoryType);
        goal.id = id;
        
        return goal
    }
    
    
    func saveGoal(goal: Goal){
        
        var numGoals: Int
        numGoals = self.savedInformation.integerForKey("NUM_GOALS") // Primeira vez q ele procurar vai dar 0, então ele vai salvar no Goal_0
        
        goal.id = numGoals
        
        savedInformation.setObject(goal.name, forKey: "GOAL_NAME_\(goal.id)")
        savedInformation.setFloat(goal.price, forKey: "GOAL_PRICE_\(goal.id)")
        savedInformation.setFloat(goal.moneySaved, forKey: "GOAL_SAVED_\(goal.id)")
        savedInformation.setInteger(goal.priority, forKey: "GOAL_PRIORITY_\(goal.id)")
        savedInformation.setObject(goal.categoryType.description, forKey: "GOAL_CATEGORY_\(goal.id)")
        
        numGoals++
        
        self.savedInformation.setInteger(numGoals, forKey: "NUM_GOALS")
        self.savedInformation.synchronize()
        
    }
    
    func updateGoal(goal: Goal,value: Float){
        
        goal.moneySaved = goal.moneySaved + value
    
    }
    
    func deleteGoal(id: Int){

        var numGoals = self.savedInformation.integerForKey("NUM_GOALS")

        for (var i = (id + 1); i < numGoals; i++) {

            var goal : Goal = getGoalById(i);

            self.savedInformation.setObject(goal.name, forKey: "GOAL_NAME_\(i-1)")
            self.savedInformation.setFloat(goal.price, forKey: "GOAL_PRICE_\(i-1)")
            self.savedInformation.setFloat(goal.moneySaved, forKey: "GOAL_SAVED_\(i-1)")
            self.savedInformation.setInteger(goal.priority, forKey: "GOAL_PRIORITY_\(i-1)")
            self.savedInformation.setObject(goal.categoryType.description, forKey: "GOAL_CATEGORY_\(i-1)")

        }
        
        numGoals -= 1;
        self.savedInformation.setInteger(numGoals, forKey: "NUM_GOALS")
    }
    
}
