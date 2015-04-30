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
    
    
}
