//
//  AppModels.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import Foundation

//Need class so we don't pas around copies. We want the user reference
class User {
    var username: String = ""
    var name: String = ""
}

class Whiskey: Identifiable, Decodable{
    var id:UUID?
    var type:String
    var brand:String
    var imageUrl:String
}

class Comment: Identifiable, Decodable{
    var id:UUID?
    var comment:String
    var commentImage:String
    var imageUrl:String
    var commentUpdated:Date
    var whiskey:String
    var commentorName:String
    var commentorRef:String
}
