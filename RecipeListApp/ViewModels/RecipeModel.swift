//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Milos Pavlovic on 7.2.23..
//

import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingergient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
 
        
        
        return String(targetServings)
    }
}
