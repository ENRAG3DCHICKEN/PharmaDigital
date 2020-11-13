//
//  UserDetailsView.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/9/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    
    @State var selection: Int? = nil
    var body: some View {
        
        VStack(spacing: 0) {

        Image("cropped-img7")
            .resizable()
            .frame(height: UIScreen.main.bounds.height * 0.2)
            .overlay(
                Text("Account Profile").font(.title)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .opacity(0.7)
            )
            
        Text("")
            
        NavigationLink(destination: PatientInfoView(), tag: 1, selection: $selection) {
            Button(action: {
                self.selection = 1
            }, label: {
                HStack {
                    
                Text("Patient Info").font(.body).bold()
                Spacer()
                Text(">").font(.body).bold()
                }.padding()
                
            })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
        NavigationLink(destination: HealthProfileView1(), tag: 2, selection: $selection) {
            Button(action: {
                self.selection = 2
            }, label: {
                HStack {
                    
                Text("Health Profile").font(.body).bold()
                Spacer()
                Text(">").font(.body).bold()
                }.padding()
            })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
        NavigationLink(destination: InsuranceView(), tag: 3, selection: $selection) {
            Button(action: {
                self.selection = 3
            }, label: {
                HStack {
                    Text("Insurance Details").font(.body).bold()
                    Spacer()
                    Text(">").font(.body).bold()
                }.padding()
            })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
        NavigationLink(destination: ShippingView(), tag: 4, selection: $selection) {
            Button(action: {
                self.selection = 4
        }, label: {
            HStack {
                Text("Delivery Shipping Address").font(.body).bold()
                Spacer()
                Text(">").font(.body).bold()
            }.padding()
        })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
        NavigationLink(destination: BillingView(), tag: 5, selection: $selection) {
            Button(action: {
                self.selection = 5
            }, label: {
                HStack {
                    Text("Billing Info").font(.body).bold()
                    Spacer()
                    Text(">").font(.body).bold()
                }.padding()
            })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
        NavigationLink(destination: PrivacyView(), tag: 6, selection: $selection) {
            Button(action: {
                self.selection = 6
            }, label: {
                HStack {
                    Text("Privacy Policy").font(.body).bold()
                    Spacer()
                    Text(">").font(.body).bold()
                }.padding()
            })
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.buttonBar))
                .padding().shadow(radius: 5, y: 5)
        }
            Button(action: {
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: "password")
                self.selection = 7
            }) { Text("Logout").font(.caption) }
            Spacer()
        
        }
            
        
        
        
    }
}
