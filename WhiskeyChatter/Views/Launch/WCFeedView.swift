//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @EnvironmentObject var model: WCFeedModel
    
    var body: some View {
        /*ScrollView(showsIndicators: false){
            ForEach(){ item in
                VStack{
                    
                }
                
            }
        }*/
        if model.feedItems.count > 0{
            List(model.feedItems){item in
                Text(item.comment)
            }
        }
    }
}

struct WCFeedView_Previews: PreviewProvider {
    static var previews: some View {
        WCFeedView()
    }
}
