//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        /*ScrollView(showsIndicators: false){
            ForEach(){ item in
                VStack{
                    
                }
                
            }
        }*/
        
        Text("hi")
    }
}

struct WCFeedView_Previews: PreviewProvider {
    static var previews: some View {
        WCFeedView()
    }
}
