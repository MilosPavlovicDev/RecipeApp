//
//  DataService.swift
//  RecipeListApp
//
//  Created by Milos Pavlovic on 7.2.23..
//

import Foundation

class DataService {
    
    
    static func getLocalData() -> [Recipe] {
        
      let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return[Recipe]()
        }
        
        
        let url = URL(filePath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                    
                }
            return recipeData
            }
            
            catch {
                print(error)
            }
            
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
