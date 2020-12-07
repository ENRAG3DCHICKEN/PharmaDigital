//
//  AdminView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-15.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct AdminHomeView: View {
    
    @State private var selection: Int?

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
                    AdminDetailsView()
                        .tabItem {
                            Image(systemName: "gearshape")
                        }
                            .tag(1)
                    
                    PendingPrescriptions()
                        .tabItem {
                            Image(systemName: "highlighter")
                        }
                            .tag(2)
                    
                    CompletedPrescriptions()
                        .tabItem {
                            Image(systemName: "folder")
                        }
                            .tag(3)
            }
            
        }
    }
}


struct AdminDetailsView: View {
    
    @State private var selection: Int?


    var body: some View {
        
        VStack {
            NavigationLink(destination: LogoView(), tag: 6, selection: $selection) {
                Button(action: {
                    UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "password")
                    self.selection = 6
                }, label: {
                    HStack {
                        Image(systemName: "key").font(.body)
                        Text("Logout").font(.body).bold()
                        Spacer()
                        Text(">").font(.body).bold()
                    }.padding()
                })
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 30)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.buttonBar))
                    .padding().shadow(radius: 5, y: 5)
            }
        }
        
    }
}

struct PendingPrescriptions: View {
    
    @State private var selection: Int?


    var body: some View {
        
        VStack {
            
        }
        
    }
}

struct CompletedPrescriptions: View {
    
    @State private var selection: Int?


    var body: some View {
        
        VStack {
            
        }
        
    }
}