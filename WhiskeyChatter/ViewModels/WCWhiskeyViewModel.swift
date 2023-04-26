//
//  WhiskeyViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import Foundation


class WCWhiskeyViewModel: ObservableObject{
    @Published var whiskeyItem = [WhiskeyCommentItem]()
    var databaseService = DatabaseService()
    
    init(){
    }
    
    func getFeedData(string) {
        databaseService.getWhiskeyData() { feedItems in
            // Set the retrieved data to the chats property
            self.feedItems = feedItems
        }
    }
}
