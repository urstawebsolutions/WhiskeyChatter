//
//  WCFeedModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/10/23.
//

import Foundation

var databaseService = DatabaseService()

class WCFeedModel: ObservableObject{
    @Published var feedItems = [WhiskeyFeedItem]()
    
    init(){
        // Get the data for the main feed
        getFeedData()
        //self.recipes = DataService.getLocalData()
    }
    
    func getFeedData() {
        // Use the database service to retrieve the chats
        //databaseService.getAllChats { chats in
        databaseService.getFeedData { feedItems in
            // Set the retrieved data to the chats property
            self.feedItems = feedItems
        }
    }
}