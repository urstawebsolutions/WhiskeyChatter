//
//  WCTabButtonView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/20/23.
//

import SwiftUI

struct WCTabButtonView: View {
    
    var buttonText: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
        
            if isActive{
                VStack (alignment: .center, spacing: 4) {
                    Image("glass-full")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text(buttonText)
                        .font(Font.tabBar)
                        .foregroundColor(Color(red: 0.853, green: 0.364, blue: 0.011))
                        .fontWeight(.bold)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            else{
                VStack (alignment: .center, spacing: 4) {
                    Image("glass-empty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text(buttonText)
                        .font(Font.tabBar)
                        .accentColor(.white)
                        .fontWeight(.bold)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}



struct WCTabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WCTabButtonView(buttonText: "Chatter", isActive: true)
    }
}
