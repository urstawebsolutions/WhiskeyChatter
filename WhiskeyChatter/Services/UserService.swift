//
//  UserService.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import Foundation

class UserService{
    var user = User()
    static var sharedUser = UserService()
    private init(){
    }
}
