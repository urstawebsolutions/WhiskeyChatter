//
//  WCWhiskeyView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/25/23.
//

import SwiftUI
import Firebase

struct WCLiquorView: View {
    let liquorId: DocumentReference
    @StateObject private var vm = WCLiquorViewModel()
    
    var body: some View {
        VStack{
            if vm.liquorItem != nil{
                AsyncImage(url: URL(string: vm.liquorItem!.image!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 190, height: 190)
                        .cornerRadius(14)
                        .clipped()
                }placeholder: {
                    ProgressView() //TODO: Figure out what this does
                }
                Text(vm.liquorItem!.name!)
                Text(vm.liquorItem!.location!)
                
                Spacer()
                
                if vm.liqourComItems.count > 0{
                    NavigationView{
                        List(vm.liqourComItems) { r in
                            NavigationLink(
                                destination: WCFeedView(),
                                label:{
                                    HStack(spacing: 20.0){
                                        Text(r.comment)
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
            vm.getLiquorData(liquorId: liquorId.path)
            vm.getLiquorComments(liquorId: liquorId)
        }
    }
}


struct WCLiquorView_Previews: PreviewProvider {
    static var previews: some View {
        let docRef: DocumentReference? = nil
        WCLiquorView(liquorId: docRef!)
    }
}
