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
    
    func searchGoals() -> [Goal]{
        
        var numGoals: Int
        var name: String
        var price: Float
        var moneySaved: Float
        var priority: Int
        var categoryType: String
        
        var goals: [Goal] = []
        var i : Int
        
        numGoals = self.savedInformation.integerForKey("NUM_GOALS")
        
        if(numGoals > 0){
            for (i = 0; i < numGoals; i++) {
            
                name = self.savedInformation.stringForKey("GOAL_NAME_\(i)")!
                price = self.savedInformation.floatForKey("GOAL_PRICE_\(i)")
                moneySaved = self.savedInformation.floatForKey("GOAL_SAVED_\(i)")
                priority = self.savedInformation.integerForKey("GOAL_PRIORITY_\(i)")
                categoryType = self.savedInformation.stringForKey("GOAL_CATEGORY_\(i)")!
                
                var currentGoal = Goal(name: name, price: price, moneySaved: moneySaved, priority: priority, categoryType: CategoryType.convert(categoryType))
                
                goals.append(currentGoal)
                
          }
          
        }
        
        return goals
        
    }
    
    
    func saveGoal(goal: Goal){
        
        var numGoals: Int
        numGoals = self.savedInformation.integerForKey("NUM_GOALS") // Primeira vez q ele procurar vai dar 0, então ele vai salvar no Goal_0
        
        goal.id = numGoals
        
        
        self.savedInformation.setObject(goal.name, forKey: "GOAL_NAME_\(goal.id)")
        self.savedInformation.setFloat(goal.price, forKey: "GOAL_PRICE_\(goal.id)")
        self.savedInformation.setFloat(goal.moneySaved, forKey: "GOAL_SAVED_\(goal.id)")
        self.savedInformation.setInteger(goal.priority, forKey: "GOAL_PRIORITY_\(goal.id)")
        self.savedInformation.setObject(goal.categoryType.description, forKey: "GOAL_CATEGORY_\(goal.id)")
        
        numGoals++
        
        self.savedInformation.setInteger(numGoals, forKey: "NUM_GOALS")
        
        self.savedInformation.synchronize()
        
    }
    
    func updateGoal(goal: Goal,value: Float){
        
        goal.moneySaved = goal.moneySaved + value
    
    }
    
    func deleteGoal(id: Int) -> [Goal]{

        var name: String
        var price: Float
        var moneySaved: Float
        var priority: Int
        var categoryType: String
        
        var i: Int
        i = 0
        
        var goalsAfterDelete: [Goal] = []
        
        var position = id
        
        var numGoals: Int
        numGoals = self.savedInformation.integerForKey("NUM_GOALS")
        
          position++
        
          for i = position; i < numGoals; i++ {
            
            name = self.savedInformation.stringForKey("GOAL_NAME_\(i)")!
            price = self.savedInformation.floatForKey("GOAL_PRICE_\(i)")
            moneySaved = self.savedInformation.floatForKey("GOAL_SAVED_\(i)")
            priority = self.savedInformation.integerForKey("GOAL_PRIORITY_\(i)")
            categoryType = self.savedInformation.stringForKey("GOAL_CATEGORY_\(i)")!
            
            self.savedInformation.setObject(name, forKey: "GOAL_NAME_\(i-1)")
            self.savedInformation.setFloat(price, forKey: "GOAL_PRICE_\(i-1)")
            self.savedInformation.setFloat(moneySaved, forKey: "GOAL_SAVED_\(i-1)")
            self.savedInformation.setInteger(priority, forKey: "GOAL_PRIORITY_\(i-1)")
            self.savedInformation.setObject(categoryType, forKey: "GOAL_CATEGORY_\(i-1)")

            }
        
        numGoals = numGoals - 1;
        self.savedInformation.setInteger(numGoals, forKey: "NUM_GOALS")
        
        goalsAfterDelete = self.searchGoals()
        
        return goalsAfterDelete
    }
    
}
