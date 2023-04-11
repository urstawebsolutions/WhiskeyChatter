//
//  WCProfileView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/4/23.
//

import SwiftUI
import FirebaseAuth

struct WCProfileView: View {
    
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        
        Button {
            
            // Sign out the user
            try! Auth.auth().signOut()
            
            // Change to logged out view
            model.checkLogin()
            
        } label: {
            Text("Sign Out")
        }

        
    }
}

struct WVProfileView_Previews: PreviewProvider {
    static var previews: some View {
        WCProfileView()
    }
}

