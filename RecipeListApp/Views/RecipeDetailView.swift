//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Milos Pavlovic on 8.2.23..
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedServingSize = 2
   
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
        
            VStack(alignment: .leading) {
                
                
                
                Image(recipe.image)
                    
                    
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .padding(5)
                
                VStack(alignment: .leading) {
                    //Picker
                    Text("Select Your Serving Size")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width:160)
                }.padding()
                    
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingergient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
                            
                    }
                }.padding([.leading, .bottom, .trailing], 10)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                    
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    ForEach(0..<recipe.directions.count, id:\.self) { r in
                        Text(String(r+1) + ". " + recipe.directions[r])
                            .padding(.bottom, 5)
                        
                    }
                    
                }
                .padding(.horizontal)
            }
        }.navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
