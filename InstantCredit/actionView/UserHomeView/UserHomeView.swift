//
//  homeView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-10.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct UserHomeView: View {
    
    @State private var selection = 2

    var body: some View {
        NavigationView{

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
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    }
}



struct ObtainPrescriptions: View {
    
    @State private var selection: Int? = nil
    
    var body: some View {
        
        VStack {
        
            NavigationLink(destination: NewPrescriptionView(), tag: 1, selection: $selection) {
                Button(action: {
                    self.selection = 1
                }, label: {
                    VStack {
                        Text("New Prescription")
                            .font(.body).bold()
                            .multilineTextAlignment(.center)
                    }.padding()
                    
                })
                    .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.20)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.buttonBar))
                    .padding().shadow(radius: 5, y: 5)
            }
            
            NavigationLink(destination: RefillPrescriptionView(), tag: 2, selection: $selection) {
                Button(action: {
                    self.selection = 2
                }, label: {
                    VStack {
                        
                        Text("Refill Prescription")
                            .font(.body).bold()
                            .multilineTextAlignment(.center)
                        
                    }.padding()
                    
                })
                    .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.2)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.buttonBar))
                    .padding().shadow(radius: 5, y: 5)
            }
            
            NavigationLink(destination: TransferPrescriptionView(), tag: 3, selection: $selection) {
                Button(action: {
                    self.selection = 3
                }, label: {
                    VStack {
                        
                        Text("Transfer Prescription")
                            .font(.body).bold()
                            .multilineTextAlignment(.center)
                    }.padding()
                    
                })
                    .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.height * 0.2)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.buttonBar))
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

