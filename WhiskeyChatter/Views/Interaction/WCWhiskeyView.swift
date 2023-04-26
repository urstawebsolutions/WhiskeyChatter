//
//  WCWhiskeyView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import SwiftUI

struct WCWhiskeyView: View {
    
    var whiskeyId: String
    
    var body: some View {
        if(whiskeyId != ""){
            Text(whiskeyId)
        }
        else{
            Text("Empty")
        }
    }
}

struct WCWhiskeyView_Previews: PreviewProvider {
    static var previews: some View {
        WCWhiskeyView(whiskeyId: "")
    }
}
