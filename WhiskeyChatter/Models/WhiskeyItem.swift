//
//  FeedItem.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/10/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


/*class WhiskeyItem: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var imageurl: String?
    var msg: String
    @ServerTimestamp var timestamp: Date?
    var senderid: String
}*/

struct WhiskeyCommentItem: Codable, Identifiable {
    @DocumentID var id: String?
    var commentImageUrl: String?
    var comment: String
    @ServerTimestamp var commentLastUpdated: Date?
    var commentorName:String
    var commentorRef:DocumentReference
    var whiskeyId:String
}

struct WhiskeyItem: Codable, Identifiable {
    @DocumentID var id: String?
    var commentImageUrl: String?
    var comment: String
    @ServerTimestamp var commentLastUpdated: Date?
    var commentorName:String
    var commentorRef:DocumentReference
}


