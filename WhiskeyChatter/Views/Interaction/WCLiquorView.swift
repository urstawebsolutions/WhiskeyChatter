//
//  WCWhiskeyView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import SwiftUI
import Firebase

struct WCLiquorView: View {
    let liquorType: String
    let liquorId: String
    
    @StateObject private var vm = WCLiquorViewModel()
    
    var body: some View {
        VStack{
            if vm.liquorItem != nil{
                if vm.liqourComItems.count > 0{

                        AsyncImage(url: URL(string: vm.liquorItem!.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 190, height: 190)
                                .cornerRadius(14)
                                .clipped()
                        }placeholder: {
                            ProgressView() //TODO: Figure out what this does
                        }
                        Text(vm.liquorItem!.name)
                        Text(vm.liquorItem!.location)
                        
                        Spacer()
                        List(vm.liqourComItems){ com in
                                VStack{
                                    HStack(spacing: 20.0){
                                        AsyncImage(url: URL(string: com.commentImageUrl!)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 65, height: 65)
                                                .cornerRadius(14)
                                                .clipped()
                                        }placeholder: {
                                            ProgressView() //TODO: Figure out what this does
                                        }
                                        Text(com.comment!)
                                    }
                                    HStack{
                                        Button{
                                            vm.sheetCommentReply = com
                                        }label:{
                                            Text("Replies: " + String(com.replyCount))
                                        }
                                    }
                                }
                                .sheet(item: $vm.sheetCommentReply, onDismiss: nil){ comment in
                                    WCRepliesView(comment: com, liquorItem: vm.liquorItem!)
                                }
                        }
                        

                
                    
                    /*
                    NavigationView{
                        List(vm.liqourComItems) { r in
                            NavigationLink(
                                destination: WCRepliesView(comment: r, liquorItem: vm.liquorItem!),
                                label:{
                                    VStack{
                                        HStack(spacing: 20.0){
                                            AsyncImage(url: URL(string: r.commentImageUrl!)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 65, height: 65)
                                                    .cornerRadius(14)
                                                    .clipped()
                                            }placeholder: {
                                                ProgressView() //TODO: Figure out what this does
                                            }
                                            Text(r.comment!)
                                        }
                                        HStack{
                                            Text("Replies")
                                            Text(String(r.replyCount))
                                        }
                                    }
                                }
                            )
                        }
                        .navigationBarTitle("Comments")
                    }*/
                    
                    
                    
                    
                    
                }
            }
            
        }
        .onAppear{
            vm.getLiquorData(liquorType: liquorType, liquorId: liquorId)
            vm.getLiquorComments(liquorType: liquorType, liquorId: liquorId)
        }
    }
}


struct WCLiquorView_Previews: PreviewProvider {
    static var previews: some View {
        WCLiquorView(liquorType: "", liquorId: "")
    }
}
