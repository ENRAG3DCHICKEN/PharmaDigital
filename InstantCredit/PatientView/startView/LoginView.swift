//
//  loginView1.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//



import SwiftUI
import FirebaseAuth
import Firebase
import CoreData

struct LoginView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var errorMessage: String = ""
    @State var selection: Int?
    
    var body: some View {
            VStack {
                
//                Text("")
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
                
                Image("yoga").resizable()
                        .frame(width: 100, height: 60)
                
                Text("""
                        Welcome back.
                    """)
                    .font(.headline)
                    .padding()
                    .lineLimit(nil)
                
                TextField("Email", text: $email).simultaneousGesture(TapGesture().onEnded {
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password).simultaneousGesture(TapGesture().onEnded {
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Forgot your password?").font(.caption)
                    .padding()
                    .onTapGesture(count: 1, perform: {
                        self.selection = 3
                    })
                
                Button(action: {
                    Auth.auth().signIn(withEmail: self.email.trimmingCharacters(in: .whitespacesAndNewlines), password: self.password.trimmingCharacters(in: .whitespacesAndNewlines)) { (result, err) in
                        if err != nil {
                            //
                            self.errorMessage = err!.localizedDescription
                        } else {
                            
                            UserDefaults.standard.set(self.email, forKey: "email")
                            UserDefaults.standard.set(self.password, forKey: "password")
                            
                            //Fetch Patient from Core Data and find the SignupCompletionFlag Property
                            let request = NSFetchRequest<Patient>(entityName: "Patient")
                            request.sortDescriptors = [NSSortDescriptor(key: "emailAddress", ascending: true)]
                            request.predicate = NSPredicate(format: "emailAddress = %@", UserDefaults.standard.string(forKey: "email")!)

                            let results = (try? context.fetch(request)) ?? []
                            let patient = results.first
                            
                            UserDefaults.standard.set(patient?.signupCompletionFlag,forKey: "signupCompletionFlag")
                            
                            //User authenticated - checking if user is admin account
                            let db = Firestore.firestore()
                            db.collection("admin").getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    

                                    
                                    for document in querySnapshot!.documents {
                                        
                                        //this below line is for debugging
                                        print("\(document.documentID) => \(document.data())")
                                        
                                        // Applies when user is logged in and identified as an admin account
                                        if UserDefaults.standard.string(forKey: "email") == (document.data()["email"] as! String) {
                                            self.selection = 2

                                        }
                                    }
                                    
                                    // Applies when user is logged in and not identified as an admin account
                                    if self.selection == nil {
                                        
                                        //Sign-up Process Completed - UserHomeView
                                        print(UserDefaults.standard.string(forKey: "completed") as Any)
                                        if UserDefaults.standard.string(forKey: "completed") == "true" {
                                            self.selection = 1
                                        } else {
                                            //Sign-up Process Incomplete - PatientInfoView
                                            self.selection = 4
                                        }
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                }) { Text("Log In").font(.body)  }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 30)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.mainColor))
                    .padding()
                
                VStack {
                    NavigationLink(destination: HomeView(), tag: 1, selection: $selection) { EmptyView() }
                    NavigationLink(destination: AdminHomeView(), tag: 2, selection: $selection) { EmptyView() }
                    NavigationLink(destination: PasswordResetView(), tag: 3, selection: $selection) { EmptyView() }
                    NavigationLink(destination: PharmacySearchView(), tag: 4, selection: $selection) { EmptyView() }
                    Text(errorMessage)
                    Spacer()
                }
                
            }
        }
    }
