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
        if !loggedIn {
            ZStack{
                Image("bar-background").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
                VStack () {
                    ZStack{
                        Rectangle().fill(Color.black).frame(height: 120)
                        VStack{
                            Divider().frame(width: 270, height: 2).overlay(.white)
                            Text("WHISKEY CHATTER")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 8)
                                .padding(.top, 8)
                            Divider().frame(width: 270, height: 2).overlay(.white)
                        }
                    }
                    Spacer()
                    // Sign in button
                    
                    Button {
                        // Show the login form
                        loginFormShowing = true
                    } label: {
                        Text("SIGN IN")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .frame(width: 300.0)
                    }
                    
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.962, green: 0.959, blue: 0.959))
                    .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin) {
                        WCLoginFormView(formShowing: $loginFormShowing)
                    }
                    
                    Divider()
                    
                    // Create account button
                    Button {
                        createFormShowing = true
                    } label: {
                        Text("CREATE ACCOUNT")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .frame(width: 300.0)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.962, green: 0.959, blue: 0.959))
                    .sheet(isPresented: $createFormShowing, onDismiss: checkLogin) {
                        WCLoginCreationFormView(formShowing: $createFormShowing)
                    }
                    Spacer()
                    
                }
                .onAppear {
                    checkLogin()
                }
            }
        }
        else {
            
            // Show logged in view
            WCTabView(loggedIn: $loggedIn)
        }
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
