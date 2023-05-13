//
//  WCRepliesViewModel.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 5/3/23.
//

import SwiftUI
import Firebase

struct WCRepliesView: View {
    var comment: LiquorCommentItem
    var liquorItem: LiquorItem
    @StateObject private var vm = WCRepliesViewModel()
    
    var body: some View {
        VStack{
            List(vm.replyItems) { r in
                HStack{
                    Text(r.replyName!)
                    Text(r.reply!)
                }
            }
        }
        .ignoresSafeArea()
        .overlay(closeButton, alignment: .topLeading)
        .onAppear(){
            vm.getCommentReplies(commentId: comment.id!, liquorType: comment.liquorType!)
        }
        
    }
}

private var closeButton: some View{
    Button{
    }label:{
        Image(systemName: "xmark")
            .font(.headline)
            .padding(16)
            .foregroundColor(.primary)
            .background(.thickMaterial)
    }
}

struct WCRepliesView_Previews: PreviewProvider {
    static var previews: some View {
        let comModel = WCLiquorViewModel()
        let lModel = WCLiquorViewModel()
        WCRepliesView(comment: comModel.liqourComItems[0], liquorItem: lModel.liquorItem!)
    }
}
