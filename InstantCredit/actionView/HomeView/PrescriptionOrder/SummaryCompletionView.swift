//
//  SummaryCompletionView.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/11/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct SummaryCompletionView: View {
    
    @State private var selection: Int?
    
    @State private var chosenPharmacy: Pharmacy
    @State private var indicator: Int
    
    init(chosenPharmacy: Pharmacy, indicator: Int) {
        _chosenPharmacy = State(wrappedValue: chosenPharmacy)
        _indicator = State(wrappedValue: indicator)
    }
    
    
    var body: some View {
        VStack {
            
            Section(header: Text("Your prescription will be fulfilled by: ")) {
                Text("Pharmacy Name: \(chosenPharmacy.pharmacyName!)")
                Text("Pharmacy Phone: \(chosenPharmacy.phoneNumber!)")
                Text("Pharmacy Fax: \(chosenPharmacy.faxNumber!)")
            }
            
            Section(header: Text("Your prescription will be billed to: ")) {
                Text("Billing Name: \(UserDefaults.standard.string(forKey: "fullName")!))")
                Text("Billing Address: \(UserDefaults.standard.string(forKey: "address")!))")
                Text("Billing City: \(UserDefaults.standard.string(forKey: "city")!))")
                Text("Billing Province: \(UserDefaults.standard.string(forKey: "province")!))")
                Text("Billing Postal Code: \(UserDefaults.standard.string(forKey: "postalCode")!))")
                Text("Billing Phone Number: \(UserDefaults.standard.string(forKey: "phoneNumber")!))")
            }

            
            if UserDefaults.standard.string(forKey: "shipOption") == "optionLocalPickup" {
                Section(header: Text("Your prescription will be shipped to: ")) {
                // Delivery Details
                    
                    Text("Shipping Name: \(UserDefaults.standard.string(forKey: "shipFullName")!))")
                    Text("Shipping Address: \(UserDefaults.standard.string(forKey: "shipAddress")!))")
                    Text("Shipping City: \(UserDefaults.standard.string(forKey: "shipCity")!))")
                    Text("Shipping Province: \(UserDefaults.standard.string(forKey: "shipProvince")!))")
                    Text("Shipping Postal Code: \(UserDefaults.standard.string(forKey: "shipPostalCode")!))")
                    Text("Shipping Phone Number: \(UserDefaults.standard.string(forKey: "shipPhoneNumber")!))")
                    
                    Text("Expected Delivery: (5) Business Days")
                    
                }
            } else {
                //Local Pickup Details
                Section(header: Text("Your prescription will be available for pickup at: ")) {
                    Text("Pharmacy Name: \(chosenPharmacy.pharmacyName!)")
                    Text("Pharmacy Address: \(chosenPharmacy.address!)")
                    Text("Pharmacy Postal Code: \(chosenPharmacy.postalCode!)")
                    Text("Pharmacy Phone: \(chosenPharmacy.phoneNumber!)")
                }
            }
            
            Section(header: Text("Credit Card Information: ")) {
                Text("Billing Credit Card: \(UserDefaults.standard.string(forKey: "paymentType")!))")
                Text("Billing Cardholder Name: \(UserDefaults.standard.string(forKey: "cardholderName")!))")
                Text("Billing Card Number: \(UserDefaults.standard.string(forKey: "paymentCardNumber")!))")
                Text("Billing Expiry: \(UserDefaults.standard.string(forKey: "expirationMM")!) /  \(UserDefaults.standard.string(forKey: "expirationYY")!))")
            }
            
            Button(action: { self.selection = 0 } ) { Text("< Back").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.gradiant1))
                .padding()
            
            Button(action: { self.selection = 1 } ) { Text("Confirm Order >").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.mainColor))
                .padding()
            
            NavigationLink(destination: FulfillmentView(chosenPharmacy: chosenPharmacy, indicator: indicator), tag: 0, selection: $selection) { EmptyView() }
            
            NavigationLink(destination: HomeView(), tag: 1, selection: $selection) { EmptyView() }
                    
        }
        //
        
    }
}
