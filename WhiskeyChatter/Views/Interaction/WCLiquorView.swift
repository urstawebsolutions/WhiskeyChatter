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
                
                if vm.liqourComItems.count > 0{
                    NavigationView{
                        List(vm.liqourComItems) { r in
                            NavigationLink(
                                destination: WCRepliesView(comment: r, liquorItem: vm.liquorItem!),
                                label:{
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
                                }
                            )
                        }
                        .navigationBarTitle("Comments")
                    }
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
