//
//  loginView1.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//



import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var errorMessage: String? = nil
    @State var selection: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                
                NavigationLink(destination: UserHomeView(), tag: 1, selection: $selection) { Text("") }
                
                NavigationLink(destination: AdminHomeView(), tag: 2, selection: $selection) { Text("") }
                
                Button(action: {
                    Auth.auth().signIn(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, err) in
                        if err != nil {
                            //
                            self.errorMessage = err!.localizedDescription
                        } else {
                            
                            //User authenticated - checking if user is admin account
                            
                            db.collection("admin").getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    
                                    for document in querySnapshot!.documents {
                                        
                                        //this below line is for debugging
                                        print("\(document.documentID) => \(document.data())")
                                        
                                        // Applies when user is logged in and identified as an admin account
                                        if UserDefaults.standard.string(forKey: "email")! == (document.data()["email"] as! String) {
                                            self.selection = 2

                                        }
                                    }
                                    // Applies when user is logged in and not identified as an admin account
                                    if self.selection == nil {
                                        self.selection = 1
                                    }
                                }
                            }
                        }
                    }
                }) { Text("Sign In") }
            }
        }
    }
}
