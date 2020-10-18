//
//  signUpView1.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpView: View {
    
    @State var selection: Int? = nil
    
    @State var fieldSelection: Int? = nil
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var displayErrorMessage: String = ""

    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email).simultaneousGesture(TapGesture().onEnded {
                    self.fieldSelection = 1
                })
                    .padding(10)
                SecureField("Password", text: $password).simultaneousGesture(TapGesture().onEnded {
                    self.fieldSelection = 2
                })
                    .padding(10)
                
                Spacer(minLength: 50)
                Divider()
                
                NavigationLink(destination: PrivacyPolicyView(), tag: 1, selection: $selection) { Text("") }
                NavigationLink(destination: TermsView(), tag: 2, selection: $selection) { Text("") }
                NavigationLink(destination: UserHomeView(), tag: 3, selection: $selection) { Text("") }
                    
                VStack {
                    Text("By signing up for InstantCredit, you are agreeing to our").font(.caption)
                    HStack {
                        Button(action: { self.selection = 1 }) { Text("Privacy Policy").font(.caption) }
                        Text("and").font(.caption)
                        Button(action: { self.selection = 2 }) { Text("Terms").font(.caption) }
                        Text(".").font(.caption)
                    }
                }
                    .padding()
                
                Button(action: {
                    self.displayErrorMessage = ""
                    let validationResult = validateFields(email: self.email, password: self.password)
                    if validationResult == "OK" {
                        
                        // Create the User - via FirebaseAuth
                        Auth.auth().createUser(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, err) in
                            // Check for errors
                            if err != nil {
                                // There was an error creating the user
                                self.displayErrorMessage = err!.localizedDescription
                                print(self.displayErrorMessage)
                            } else if err == nil && result != nil {
                                UserDefaults.standard.set(self.email, forKey: "email")
                                UserDefaults.standard.set(self.password, forKey: "password")                                
                                self.selection = 3
                            }
                        }
                    } else {
                        self.displayErrorMessage = validationResult
                        print(self.displayErrorMessage)
                    }
                        
                }, label: { Text("Sign Up").font(.caption) })
                    .frame(width: 150, height: 30)
                    .foregroundColor(Color(UIColor.mainColor))
                    .background(Color(.white))
                    .shadow(radius: 5)
                }
                    .padding()
                Text(displayErrorMessage)
            }
    }
}


                                    //User was created successfully, now store the first name and last name in Firestore
//                                    let db = Firestore.firestore()
//                                    db.collection("users").addDocument(data: ["firstName": "CleanFirstName", "lastName": "CleanLastName", "uid": result!.user.uid]) { (error) in
//                                        if error != nil // Show Error Message }
