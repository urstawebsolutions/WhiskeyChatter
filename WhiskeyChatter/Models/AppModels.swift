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
struct LiquorCommentItem: Codable, Identifiable {
    @DocumentID var id: String?
    var commentImageUrl: String?
    var comment: String
    @ServerTimestamp var commentLastUpdated: Date?
    var commentorName: String
    var commentorRef: DocumentReference
    var liquorRef: DocumentReference?
    var liquorType: String
}

//Liquor Items Instance
struct LiquorItem: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var location: String?
    var image: String?
}
