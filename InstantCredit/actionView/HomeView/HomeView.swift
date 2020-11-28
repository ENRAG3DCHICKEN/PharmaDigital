//
//  homeView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-10.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection: Int

    init(selectionValue: Int) {
        _selection = State(wrappedValue: selectionValue)
    }
    
    init() {
        _selection = State(wrappedValue: 2)
    }
    
    var body: some View {
        VStack {
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
                          

            TabView(selection: $selection) {
                    UserDetailsView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                            .tag(1)
                    
                    ObtainPrescriptions()
                        .tabItem {
                            Image(systemName: "plus.circle")
                        }
                            .tag(2)
                    
                    PastPrescriptions()
                        .tabItem {
                            Image(systemName: "book")
                        }
                            .tag(3)
            }
        }
    }
}



struct ObtainPrescriptions: View {
    
    @State private var selection: Int? = nil
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
                          
        
            NavigationLink(destination: NewPrescriptionView(), tag: 1, selection: $selection) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.tile1b),Color(UIColor.tile1a)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    HStack {
                        Button(action: {
                            self.selection = 1
                        }, label: {

                                VStack {
                                    HStack {
                                        Text("New")
                                            .font(.headline).bold()
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Prescription")
                                            .font(.headline).bold()
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                    Spacer()
                                    
                                }
                                    .padding()
                            
                        })
                        Spacer()
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                }
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.20)
                    .foregroundColor(Color(.white))
                    .padding().shadow(radius: 5, y: 5)
                

                
            }
            
            NavigationLink(destination: RefillPrescriptionView(), tag: 2, selection: $selection) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.tile2b),Color(UIColor.tile2a)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    HStack {
                        Button(action: {
                            self.selection = 2
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Refill")
                                        .font(.headline).bold()
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                HStack {
                                    Text("Prescription")
                                        .font(.headline).bold()
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                Spacer()
                                
                            }
                                .padding()
                            })
                            Spacer()
                            Image(systemName: "repeat")
                                .font(.title)
                                .padding()
                        }
                }
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.2)
                            .foregroundColor(Color(.white))
                            .padding().shadow(radius: 5, y: 5)
            }
            
            
            NavigationLink(destination: TransferPrescriptionView(), tag: 3, selection: $selection) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.tile3b),Color(UIColor.tile3a)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    HStack {
                        Button(action: {
                            self.selection = 3
                        }, label: {
                            VStack {
                                VStack {
                                    HStack {
                                        Text("Transfer")
                                            .font(.headline).bold()
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Prescription")
                                            .font(.headline).bold()
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                    }
                                    Spacer()
                                    
                                }
                                    .padding()
                            }
                            Spacer()
                            Image(systemName: "link")
                                .font(.title)
                                .padding()
                        })
                    }
                }
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.2)
                            .foregroundColor(Color(.white))
                            .padding().shadow(radius: 5, y: 5)
                    
            }
            
            
            
            
            
        }
    }
}


struct PastPrescriptions: View {
    
    @State private var FullName: String
    
    //PUll this from Core Data
    init() {
        _FullName = State(wrappedValue: "")
    }
    
    var body: some View {
        VStack {
        Section {
            VStack{
                
                Text("")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                              
                
                Text("In Process Prescriptions for: \(FullName)")
                //Pull Current Order History
                
                //If BLANK
                
                Text("You have no orders to be processed")
            }
            
        }
        
        Section {
            VStack {
                Text("Prescription History for: \(FullName)")
                //Pull Past Order History
                
                // If BLANK
                Text("There are no orders in your order history")
            }
        }
        }
    }
}

