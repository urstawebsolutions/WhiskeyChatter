//
//  WhiskeyViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import Foundation
import Firebase


class WCLiquorViewModel: ObservableObject{
    @Published var liquorItem: LiquorItem?
    var databaseService = DatabaseService()
    
    func getLiquorData(liquorId: String) {
        let db = Firestore.firestore()
        //TODO: Need to figure out how to get a doc from the reference path "whiskey/AVCmmW6tIISHUAs2ggFM
        //let ref = db.document(liquorId)
        let splitter = liquorId.components(separatedBy: "/")
        
        let ref = db.collection(splitter[0]).document(splitter[1])
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
}
