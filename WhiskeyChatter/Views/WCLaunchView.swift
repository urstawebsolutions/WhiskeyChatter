//
//  WCLaunchView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/31/23.
//

import SwiftUI
import FirebaseAuth

struct WCLaunchView: View {
    
    @State var loggedIn = false
    @State var loginFormShowing = false
    @State var createFormShowing = false
    
    var body: some View {
        
        
        // Check the logged in property and show the appropriate view
        //if !loggedIn {
            ZStack{
                Image("login-background").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
                VStack (spacing: 20) {
                    Text("Whiskey Chatter")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 4.0)
                    Spacer()
                    // Sign in button
                    
                    Button {
                        // Show the login form
                        loginFormShowing = true
                    } label: {
                        Text("Sign In")
                    }
                    .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin) {
                        WCLoginFormView(formShowing: $loginFormShowing)
                    }
                    
                    // Create account button
                    Button {
                        createFormShowing = true
                    } label: {
                        Text("Create Account")
                    }
                    .sheet(isPresented: $createFormShowing, onDismiss: checkLogin) {
                        WCLoginCreationFormView(formShowing: $createFormShowing)
                    }
                    
                }
                .onAppear {
                    checkLogin()
                }
            }
        //}
        //else {
            
            // Show logged in view
            //WCTabView(loggedIn: $loggedIn)
        //}
    }
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser == nil ? false : true
    }
}

struct WCLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        WCLaunchView()
    }
}
