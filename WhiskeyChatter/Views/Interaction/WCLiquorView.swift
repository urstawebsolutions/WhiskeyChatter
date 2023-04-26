//
//  WCWhiskeyView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct WCLiquorView: View {
    
    var liquorId: String
    var liquorType: String
    
    var body: some View {
        if(liquorId != ""){
            Text(liquorId)
        }
        else{
            Text("Empty")
        }
    }
}

struct WCLiquorView_Previews: PreviewProvider {
    static var previews: some View {
        WCLiquorView(liquorId: "", liquorType: "")
    }
}
