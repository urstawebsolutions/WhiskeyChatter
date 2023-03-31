//
//  WCTabView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI
import FirebaseAuth

struct WCTabView: View {
    @Binding var loggedIn: Bool
    var body: some View {
        
        VStack{
            Image(systemName: "star.fill")
            Text("Welcome to your Chatter Feed")
            Button {
                try! Auth.auth().signOut()
                loggedIn = false
            } label: {
                Text("Sign Out")
            }
        }
        
        /* TabView{
            Text("Chatter")
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Chatter")
                    }
                }
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }*/
        //.environmentObject(RecipeModel())
    }
}


