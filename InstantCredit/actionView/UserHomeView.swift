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
    
    
    @State var selection: Int? = nil
    var body: some View {
        
        VStack {

        NavigationLink(destination: PatientInfoView(), tag: 1, selection: $selection) {
            Button(action: {
                self.selection = 1
            }, label: { Text("Patient Info").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
        }
        NavigationLink(destination: HealthProfileView1(), tag: 2, selection: $selection) {
            Button(action: {
                self.selection = 2
            }, label: { Text("Health Profile").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
        }
        NavigationLink(destination: InsuranceView(), tag: 3, selection: $selection) {
            Button(action: {
                self.selection = 3
            }, label: { Text("Insurance Details").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
        }
        NavigationLink(destination: ShippingView(), tag: 4, selection: $selection) {
            Button(action: {
                self.selection = 4
            }, label: { Text("Delivery Shipping Address").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
        }
        NavigationLink(destination: BillingView(), tag: 5, selection: $selection) {
            Button(action: {
                self.selection = 5
            }, label: { Text("Billing Info").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
        }
        NavigationLink(destination: PrivacyView(), tag: 6, selection: $selection) {
            Button(action: {
                self.selection = 6
            }, label: { Text("Privacy Policy").font(.body) })
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .foregroundColor(Color(UIColor.mainColor))
                .background(Color(.white))
                .padding()
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

