//
//  WCTabs.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/20/23.
//

import SwiftUI

struct WCTabsView: View {
    
    @Binding var selectedTab: Tabs  

    var body: some View {
        
        HStack (alignment: .center) {
            Button {
                selectedTab = Tabs.chatter
            } label: {
                
                WCTabButtonView(buttonText: "CHATTER",
                                isActive: selectedTab == Tabs.chatter)
            }
            
            Button {
                selectedTab = .hunt
            } label: {
                
                WCTabButtonView(buttonText: "HUNT",
                                isActive: selectedTab == Tabs.hunt)
            }
            
            Button {
                selectedTab = .ping
                
            } label: {
                
                WCTabButtonView(buttonText: "PING",
                                isActive: selectedTab == Tabs.ping)
            }
            
            Button {
                selectedTab = .post
            } label: {
                
                WCTabButtonView(buttonText: "POST",
                             isActive: selectedTab == Tabs.post)
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
        .background(.black)
        
    }
}

struct WCTabsView_Previews: PreviewProvider {
    static var previews: some View {
        WCTabsView(selectedTab: .constant(.chatter))
    }
}

