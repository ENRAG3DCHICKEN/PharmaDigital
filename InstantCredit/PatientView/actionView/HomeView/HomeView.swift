//
//  homeView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-10.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

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



struct PastPrescriptions: View {
    
    var body: some View {
        VStack {
            Section {
                VStack{
                    
                    Text("")
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                                  
                    
                    
                    Text("In Process Prescriptions for: \(UserDefaults.standard.string(forKey: "fullName")!)").font(.headline)
                    //Pull Current Order History
                    
                    //If BLANK
                    Text("You have no orders to be processed").font(.body)
                    
                    Text("Prescription History for: \(UserDefaults.standard.string(forKey: "fullName")!)").font(.headline)
                    //Pull Past Order History
                    
                    // If BLANK
                    Text("There are no orders in your order history").font(.body)
                }
            }
        }
        
    }
}
