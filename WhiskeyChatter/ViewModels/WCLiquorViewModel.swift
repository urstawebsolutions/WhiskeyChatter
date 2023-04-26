//
//  WhiskeyViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import Foundation


class WCLiquorViewModel: ObservableObject{
    //@Published var liquorItem = [liquorItem]()
    var databaseService = DatabaseService()
    
    init(){
    }
    
    func getFeedData(string) {
       // databaseService.getliquorData() { feedItems in
            // Set the retrieved data to the chats property
        //    self.feedItems = feedItems
       // }
    //}
}
