//
//  WCRepliesViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 5/4/23.
//

import Foundation
import Firebase

class WCRepliesViewModel: ObservableObject{
    @Published var replyItems = [LiquorCommentReply]()
    
    //Get Comment Replies
    func getCommentReplies(commentId: String, liquorType: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        //Build Collection String EX: whiskeyComments
        let commentCollection = liquorType + "Comments"
        
        let query = db.collection(commentCollection)
            .document(commentId)
            .collection("Replies")
            .order(by: "replyDate", descending: false)
        
        query.getDocuments { snapshot, error in
            
            if snapshot != nil && error == nil {
                
                var liquorReplyItems = [LiquorCommentReply]()
                
                // Loop through all the returned chat docs
                for doc in snapshot!.documents {
                    
                    let replyItem = try? doc.data(as: LiquorCommentReply.self)
                    
                    // Add the chat into the array
                    if let replyItem = replyItem {
                        liquorReplyItems.append(replyItem)
                    }
                }
                
                // Return the data
                self.replyItems = liquorReplyItems
            }
            else {
                print("Error in database retrieval")
            }
        }
    }
}
