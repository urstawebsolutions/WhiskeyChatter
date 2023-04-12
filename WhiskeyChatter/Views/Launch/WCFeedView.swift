//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @EnvironmentObject var feedModel: WCFeedModel
    
    var body: some View {
        /*ScrollView(showsIndicators: false){
            ForEach(){ item in
                VStack{
                    
                }
                
            }
        }*/
        if feedModel.feedItems.count > 0{
            List(feedModel.feedItems){item in
                Text(item.comment)
            }
        }
        else{
            Text("Hi")
        }
    }
}

struct WCFeedView_Previews: PreviewProvider {
    static var previews: some View {
        WCFeedView()
    }
}
