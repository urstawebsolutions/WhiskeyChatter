//
//  WCTabButtonView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/20/23.
//

import SwiftUI

struct WCTabButtonView: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            
            /*if isActive {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }*/
            
            
            VStack (alignment: .center, spacing: 4) {
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                Text(buttonText)
                    .font(Font.tabBar)
                    .accentColor(.black)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        
    }
}


struct WCTabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WCTabButtonView(buttonText: "Chatter", imageName: "bubble.left", isActive: true)
    }
}
