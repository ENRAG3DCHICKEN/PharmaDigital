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
    @State var selection: Bool? = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                
                NavigationLink(destination: HomeView(), tag: true, selection: $selection) { Text("") }
                
                Button(action: {
                    Auth.auth().signIn(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, err) in
                        if err != nil {
                            //
                            self.errorMessage = err!.localizedDescription
                        } else {
                            self.selection = true
                        }
                    }
                }) { Text("Sign In") }
            }
        }
    }
}
