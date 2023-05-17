//
//  AppModels.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

//Need class so we don't pass around copies. We want the user reference
class User {
    var username: String = ""
    var name: String = ""
}

//Comment Item Instance
struct LiquorCommentItem: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var commentImageUrl: String?
    var comment: String?
    @ServerTimestamp var commentLastUpdated: Date?
    var commentorName: String?
    var commentorRef: DocumentReference
    var liquorDocId: String?
    var liquorType: String?
    var isDeleted: Bool
    var replyCount: Int
    //var replies: [LiquorCommentReply]?  //Not Allowed in Hashable
}

//Liquor Items Instance
struct LiquorCommentReply: Codable, Identifiable {
    @DocumentID var id: String?
    var reply: String?
    @ServerTimestamp var replyDate: Date?
    var commentId: String?
    var replyName: String?
}

//Liquor Items Instance
struct LiquorItem: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var location: String
    var image: String
}

//Post
struct Post: Identifiable, Codable{
    @DocumentID var id: String?
    var comment: String
    var imageUrl: URL?
    var imageferenceId: String = ""
    var publishedDate: Date = Date()
    var likedIds: [String] = []
    //var dislikeIds: [String] = []
    var userName: String
    var userId: String
    var userProfileUrl: URL
    
    enum CodingKeys: CodingKey{
        case id
        case text
        case imageUrl
        case imageReferenceId
        case publishedDate
        case likedIds
        //case dislikedIds
        case userName
        case userId
        case userProfileUrl
    }
}


