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

        TabView(selection: $selection) {
                UserDetails()
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

struct UserDetails: View {
    var body: some View {
        List {
            NavigationLink(destination: PatientInfoView()) {
                Text("Patient Info")
            }
            NavigationLink(destination: HealthProfileView1()) {
                Text("Health Profile")
            }
            NavigationLink(destination: InsuranceView()) {
                Text("Insurance Details")
            }
            NavigationLink(destination: ShippingView()) {
                Text("Shipping Details")
            }
            NavigationLink(destination: BillingView()) {
                Text("Billing Info")
            }
            NavigationLink(destination: PrivacyView()) {
                Text("Privacy Info")
            }

        }
        
    }
}

struct ObtainPrescriptions: View {
    var body: some View {
        Text("B")
    }
}


struct PastPrescriptions: View {
    var body: some View {
        Text("C")
    }
}


//
//                Button(action: {
//                    UserDefaults.standard.removeObject(forKey: "email")
//                    UserDefaults.standard.removeObject(forKey: "password")
//                    self.selection = 0
//                }) { Text("Logout").font(.caption) }
//                    .tabItem {
//                        Image("")
//                    }
