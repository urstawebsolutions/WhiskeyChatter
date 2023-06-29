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
    @State private var showingSheet = false
    @Binding var selectedTab: Tabs
    //@Binding var isChatShowing: Bool    

    var body: some View {
        
        /*HStack (alignment: .center) {
            Button {
                selectedTab = .chatter
            } label: {
                
                WCTabButtonView(buttonText: "CHATTER",
                             isActive: selectedTab == .chatter)
            }
            
            Button {
                selectedTab = .hunt
            } label: {
                
                WCTabButtonView(buttonText: "HUNT",
                             isActive: selectedTab == .hunt)
            }
            
            Button {
                selectedTab = .ping
                
            } label: {
                
                WCTabButtonView(buttonText: "PING",
                             isActive: selectedTab == .ping)
            }
            
            Button {
                selectedTab = .post
            } label: {
                
                WCTabButtonView(buttonText: "POST",
                             isActive: selectedTab == .post)
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
         */
        
        NavigationView {
                Text("Hello, world!")
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Spacer()
                            Button {
                                  //action
                            } label: {
                                Label("Main", systemImage: "house")
                            }
                            Spacer()
                            Button {
                                showingSheet = true
                            } label: {
                                Label("Main", systemImage: "square.and.arrow.up")
                            }
                            Spacer()
                        }
                    }
                    .sheet(isPresented: $showingSheet) {
                        Text("This is s sheet view")
                    }
                }
        
    }
}

struct WCTabsView_Previews: PreviewProvider {
    static var previews: some View {
        WCTabsView(selectedTab: .constant(.chatter))
    }
}

