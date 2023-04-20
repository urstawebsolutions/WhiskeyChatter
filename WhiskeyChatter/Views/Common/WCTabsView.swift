//
//  WCTabs.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/20/23.
//

import SwiftUI

enum Tabs: Int {
    case chatter = 0
    case hunt = 1
    case ping = 2
    case post = 3
    
}

struct WCTabsView: View {
    
    @Binding var selectedTab: Tabs
    //@Binding var isChatShowing: Bool    
    @EnvironmentObject var chatViewModel: WCFeedModel

    var body: some View {
        
        HStack (alignment: .center) {
            
            Button {
                // Switch to chatter
                selectedTab = .chatter
                
            } label: {
                
                WCTabButtonView(buttonText: "CHATTER",
                             imageName: "glass-full",
                             isActive: selectedTab == .chatter)
                
            }
            
            Button {
                // Switch to chatter
                selectedTab = .hunt
                
            } label: {
                
                WCTabButtonView(buttonText: "HUNT",
                             imageName: "glass-empty",
                             isActive: selectedTab == .chatter)
                
            }
            
            Button {
                // Switch to chatter
                selectedTab = .ping
                
            } label: {
                
                WCTabButtonView(buttonText: "PING",
                             imageName: "glass-empty",
                             isActive: selectedTab == .chatter)
                
            }
            
            Button {
                // Switch to chatter
                selectedTab = .post
                
            } label: {
                
                WCTabButtonView(buttonText: "POST",
                             imageName: "glass-empty",
                             isActive: selectedTab == .chatter)
                
            }
            
            /*
            Button {
                
                // Clear the selected chat
                chatViewModel.clearSelectedChat()
                
                // Show conversation view for new message
                isChatShowing = true
                
            } label: {
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    
                    Text("New Chat")
                        .font(Font.tabBar)
                }
                
            }
            .tint(Color("icons-primary"))
            
            
            
            Button {
                // Switch to contacts
                selectedTab = .contacts
            } label: {
                
                WCTabButtonView(buttonText: "Contacts",
                             imageName: "person",
                             isActive: selectedTab == .contacts)
            }
            .tint(Color("icons-secondary"))
            */
            
        }
        .frame(height:75)
        .background(Color.gray)
        
    }
}

struct WCTabsView_Previews: PreviewProvider {
    static var previews: some View {
        WCTabsView(selectedTab: .constant(.chatter))
    }
}

