//
//  WCFeedView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/6/23.
//

import SwiftUI

struct WCFeedView: View {
    @StateObject private var wcFeedViewModel = WCFeedViewModel()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                let columns = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
                if wcFeedViewModel.feedItems.count > 0{
                    NavigationStack{
                        HStack{
                            Text("WHISKEY CHATTER")
                                .font(Font.header)
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                            Spacer()
                            HStack(spacing: 20.0){
                                
                                NavigationLink{
                                    //WCNotificationView()
                                }
                                label: {
                                    Image(systemName: "bell")
                                        .foregroundColor(Color.white)
                                }
                                
                                NavigationLink{
                                    //WCSearchView()
                                }
                                label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color.white)
                                }
                                
                                NavigationLink{
                                    WCProfileView()
                                }
                                label: {
                                    Image(systemName: "person")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .padding(.horizontal,15)
                        .padding(.vertical,3)
                        .background(Color.black)
                        
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(wcFeedViewModel.feedItems) { item in
                                    NavigationLink(value: item){
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
                                                            Text(item.commentorName!)
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
                                        //destination: WCLiquorView(liquorType:item.liquorType!, liquorId: item.liquorDocId!),
                                    }//End NavStack
                                }//End Foreach
                            }
                            .navigationDestination(for: LiquorCommentItem.self){ item in
                                WCLiquorView(liquorType:item.liquorType!, liquorId: item.liquorDocId!)
                            }
                        }
                     }
                }
                else{
                    Text("No data returned to feed")
                    //Show Message that no data was returned
                }
            }
        }
    }
}

struct WCFeedView_Previews: PreviewProvider {
    static var previews: some View {
        WCFeedView()
    }
}
