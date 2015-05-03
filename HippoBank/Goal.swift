//
//  Goal.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 4/30/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

class Goal
{
    var name: String!
    var id: Int!
    var price: Float!
    var moneySaved: Float!
    var categoryType: CategoryType!
    var priority: Int!
    
    init(){
        
    }
    
    init (name: String, price: Float, moneySaved: Float, priority: Int, categoryType: CategoryType)
    {
        self.name = name
        self.price = price
        self.moneySaved = moneySaved
        self.priority = priority
        self.categoryType = categoryType
    }

}
