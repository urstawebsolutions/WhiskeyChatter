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
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        if feedModel.feedItems.count > 0{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(feedModel.feedItems) { item in
                        AsyncImage(url: URL(string: item.commentImageUrl!)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 180, height: 180)
                    }
                }
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
