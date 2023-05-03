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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WCRepliesView_Previews: PreviewProvider {
    static var previews: some View {
        let comModel = WCLiquorViewModel()
        let lModel = WCLiquorViewModel()
        WCRepliesView(comment: comModel.liqourComItems[0], liquorItem: lModel.liquorItem!)
    }
}
