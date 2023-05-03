//
//  WhiskeyViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import Foundation
import Firebase


class WCLiquorViewModel: ObservableObject{
    //TODO: Investiate more why i am adding ? and having to unwrap. When to use ? and when to not. NEED TO UNDERSTAND THIS BETTER
    @Published var liquorItem: LiquorItem?
    @Published var liqourComItems = [LiquorCommentItem]()
    var databaseService = DatabaseService()
    
    //TODO: Error Hanbdling
    func getLiquorData(liquorType:String, liquorId: String) {
        let db = Firestore.firestore()
        let ref = db.collection(liquorType).document(liquorId)
        ref.getDocument { snapshot, error in
            
            // Check there's no errors
            guard error == nil, snapshot != nil else {
                return
            }
            
            // Parse the data out
            let data = snapshot!.data()
            let id = data?["id"] as? String ?? ""
            let name = data?["name"] as? String ?? ""
            let location = data?["location"] as? String ?? ""
            let imageUrl = data?["image"] as? String ?? ""
            self.liquorItem = LiquorItem(id:id, name:name, location:location, image:imageUrl)
        }
    }
    
    //Get comments for a specific Liqour
    //TODO: Set up db.collection to allow different collection input for multiple liquors
    //TODO: Error Handling
    func getLiquorComments(liquorType:String, liquorId: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        //Build Collection String EX: whiskeyComments
        let commentCollection = liquorType + "Comments"
        
        //TODO: Figure out algorithm for how we want it to display
        let query = db.collection(commentCollection).whereField("liquorDocId", isEqualTo: liquorId)
            //.order(by: "commentLastUpdated", descending: false)
    
        query.getDocuments { snapshot, error in
            
            if snapshot != nil && error == nil {
                
                var liquorCommentItems = [LiquorCommentItem]()
                
                // Loop through all the returned chat docs
                for doc in snapshot!.documents {
                    
                    let liqItem = try? doc.data(as: LiquorCommentItem.self)
                    
                    // Add the chat into the array
                    if let liqItem = liqItem {
                        liquorCommentItems.append(liqItem)
                    }
                }
                
                // Return the data
                self.liqourComItems = liquorCommentItems
            }
            else {
                print("Error in database retrieval")
            }
        }
    }
    
}
