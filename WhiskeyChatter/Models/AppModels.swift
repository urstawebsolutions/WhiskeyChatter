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
    var userId: String = ""
    var username: String = ""
    var name: String = ""
}

//Comment Item Instance
struct LiquorCommentItem: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var commentImageUrl: String?
    var comment: String?
    @ServerTimestamp var commentLastUpdated: Date?
    @ServerTimestamp var commentPublishedDate: Date?
    var commentorName: String?
    var commentorId: String?
    var imageReferenceId: String?
    var liquorDocId: String?
    var liquorType: String?
    var isDeleted: Bool
    var replyCount: Int
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
    var commentImageUrl: String
    var imageReferenceId: String = ""
    var commentPublishedDate: Date = Date()
    var commentLastUpdated: Date = Date()
    var commentorName: String
    var commentorId: String
    var liquorType: String
    var liquorDocId: String
    var replyCount: Int = 0
    var isDeleted: Bool = false
    
   /*enum CodingKeys: CodingKey{
        case id
        case text
        case imageUrl
        case imageReferenceId
        case publishedDate
        case lastUpdated
        case likedIds
        case dislikedIds
        case userName
        case userId
        case userProfileUrl
        case liquorType
        case liquorDocId
        case replyCount
        case isDeleted
    }*/
}


