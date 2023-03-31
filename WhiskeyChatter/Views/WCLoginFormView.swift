//
//  ContentView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI
import FirebaseAuth


struct WCLoginFormView: View {
    @Binding var formShowing: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        
        NavigationView {

            Form {
                
                Section {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    
                    // Perform login
                    signIn()
                    
                }, label: {
                    HStack {
                        Spacer()
                        Text("Sign inn")
                        Spacer()
                    }
                })
                
                Section{
                    Button(action: {
                        // Create account
                        formShowing = false
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                            Spacer()
                        }
                    })
                }
            }
            .navigationBarTitle("Sign In")
            .background(
                Image("login-background")
            )
        }
        
    }
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    
                    // Sign in successful
                    
                    // Dismiss this sheet
                    formShowing = false
                }
                else {
                    // If there's an issue with logging in
                    errorMessage = error!.localizedDescription
                }
            }
        }
        
    }
}

struct WCLoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        WCLoginFormView(formShowing: Binding.constant(true))
    }
}
