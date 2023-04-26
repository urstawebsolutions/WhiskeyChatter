//
//  WCMenuView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/21/23.
//

import SwiftUI

struct WCMenuView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            HStack{
                Text("WHISKEY CHATTER")
                    .font(Font.header)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                Spacer()
                HStack(spacing: 20.0){
                    Image(systemName: "bell")
                        .foregroundColor(Color.white)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                    Image(systemName: "person")
                        .foregroundColor(Color.white)
                }
            }
            .padding(.horizontal,15)
            .padding(.vertical,3)
        }.frame(height:55)
    }
}


struct WCMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WCMenuView()
    }
}
