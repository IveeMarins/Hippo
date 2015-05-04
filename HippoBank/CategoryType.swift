//
//  Categoria.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 4/30/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

enum CategoryType{
    
    case Clothes, Games, Eletronics, Education, Traveling, Books, Furniture, Cars, Properties
    
    var description: String
    {
        get {
            switch (self)
            {
            case .Clothes: return "Clothes"
            case .Games: return "Games"
            case .Eletronics: return "Eletronics"
            case .Education: return "Education"
            case .Traveling: return "Traveling"
            case .Books: return "Books"
            case .Furniture: return "Furniture"
            case .Cars: return "Cars"
            case .Properties: return "Properties"
            }
        }
    }
    static func convert(description: String) -> CategoryType{
    
            switch (description)
            {
            case "Clothes": return .Clothes
            case "Games": return .Games
            case "Eletronics": return .Eletronics
            case "Education": return .Education
            case "Traveling": return .Traveling
            case "Books": return .Books
            case "Furniture": return .Furniture
            case "Cars": return .Cars
            case "Properties": return .Properties
            default: return .Clothes
            }
    }
    
    static func getCategoryImage(description: String) -> String{
        
        switch (description)
        {
        case "Clothes": return "categoryClothes"
        case "Games": return "categoryGames"
        case "Eletronics": return "categoryEletronics"
        case "Education": return "categoryEducations"
        case "Traveling": return "categoryTravels"
        case "Books": return "categoryBooks"
        case "Furniture": return "categoryFurnitures"
        case "Cars": return "categoryCars"
        case "Properties": return "categoryProperties"
        default: return ""
        }
    }
    
    static func getCategoryArray() -> [String]{
        
        var categories: [String] = []
        
        categories.append("Clothes")
        categories.append("Games")
        categories.append("Eletronics")
        categories.append("Education")
        categories.append("Traveling")
        categories.append("Books")
        categories.append("Furniture")
        categories.append("Cars")
        categories.append("Properties")
        
        return categories
        
    }
    
}
