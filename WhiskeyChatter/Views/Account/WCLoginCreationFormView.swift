//
//  WCLoginCreationFormView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/31/23.
//

import SwiftUI
import FirebaseAuth

struct WCLoginCreationFormView: View {
    
    @Binding var formShowing: Bool
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    
    @State private var errorMessage: String?
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Email", text: $email)
                    TextField("Name", text: $name)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    // Create account
                    createAccount()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Create Account")
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
            .navigationBarTitle("Create an Account")
            
        }
        
    }
    
    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    // Dismiss the form
                    formShowing = false
                }
                else {
                    errorMessage = error!.localizedDescription
                }
            }
            
        }
    }
}

struct WCLoginCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        WCLoginCreationFormView(formShowing: Binding.constant(true))
    }
}

