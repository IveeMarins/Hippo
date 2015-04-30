//
//  Goal.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 4/30/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

class Goal: NSObject {
   
    var name: String!
    var id: Int?
    var price: Float!
    var moneySaved: Float!
    var category: Int!
    var priority: Int!
    
    var categoryType: CategoryType {
        get{
            switch category {
            case 0: return CategoryType.Clothes
            case 1: return CategoryType.Games
            case 2: return CategoryType.Eletronics
            case 3: return CategoryType.Education
            case 4: return CategoryType.Traveling
            case 5: return CategoryType.Books
            case 6: return CategoryType.Furniture
            case 7: return CategoryType.Properties
            default: return CategoryType.Clothes
            }
            
        }
        set(newCategory) {
            switch newCategory {
            case CategoryType.Clothes: category = 0
            case CategoryType.Games: category = 1
            case CategoryType.Eletronics: category = 2
            case CategoryType.Education: category = 3
            case CategoryType.Traveling: category = 4
            case CategoryType.Books: category = 5
            case CategoryType.Furniture: category = 6
            case CategoryType.Properties: category = 7
            default: category = 0
            }
        }
    }
    
    
    init(name:String, price: Float, moneySaved: Float, category: Int,priority: Int){
        
        self.name = name
        self.price = price
        self.moneySaved = moneySaved
        self.category = category
        self.priority = priority
        
    }
    
    
}
