//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        
        /*NavigationView{
            List(model.recipes) { r in
                NavigationLink(
                    //destination: RecipeDetailView(recipe:r),
                    label:{
                        HStack(spacing: 20.0){
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    }
                )
            }
            .navigationBarTitle("All Recipes")
        }*/
        Text("hiu")
    }
}

struct WCFeedView_Previews: PreviewProvider {
    static var previews: some View {
        WCFeedView()
    }
}
