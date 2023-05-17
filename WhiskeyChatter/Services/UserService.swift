//
//  UserService.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import Foundation

//Lets us set the User info and use it throughout the app
class UserService{
    var user = User()
    static var sharedUser = UserService()
    private init(){
    }
}
