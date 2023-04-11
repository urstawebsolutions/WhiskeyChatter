//
//  FeedItem.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/10/23.
//

import Foundation

class WhiskeyItem: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var image:String
    var featured:Bool
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var directions:[String]
}

class WhiskeyFeedItem: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var image:String
    var featured:Bool
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var directions:[String]
}


