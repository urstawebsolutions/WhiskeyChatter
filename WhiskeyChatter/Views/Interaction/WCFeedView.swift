//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @EnvironmentObject var wcFeedViewModel: WCFeedViewModel
    
    var body: some View {
        
        let columns = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
        if wcFeedViewModel.feedItems.count > 0{
            NavigationView{
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(wcFeedViewModel.feedItems) { item in
                            NavigationLink(
                                destination: WCWhiskeyView(whiskeyId: item.whiskeyId),
                                label:{
                                    AsyncImage(url: URL(string: item.commentImageUrl!)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 190, height: 190)
                                            .cornerRadius(14)
                                            .clipped()
                                            .overlay(
                                                ZStack{
                                                    HStack{
                                                        Text(item.commentorName)
                                                            .padding(6)
                                                            .foregroundColor(.white)
                                                            .font(Font.feedText)
                                                        Image(systemName: "bubble.left").foregroundColor(.white).padding(3)
                                                            .overlay(
                                                                ZStack{
                                                                    Text("4")
                                                                        .foregroundColor(.white)
                                                                    .font(Font.feedReplyCount)})
                                                    }
                                                }.background(Color.black)
                                                    .opacity(0.8)
                                                    .cornerRadius(10.0)
                                                    .padding(10), alignment: .bottomLeading)
                                        
                                    } placeholder: {
                                        ProgressView() //TODO: Figure out what this does
                                    }
                                }
                            )
                        }//End Foreach
                    }
                }
            }.navigationBarTitle("Whiskey")
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
