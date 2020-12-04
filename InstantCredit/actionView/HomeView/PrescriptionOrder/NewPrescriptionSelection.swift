//
//  NewPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/9/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct NewPrescriptionSelection: View {
    
    @State private var selection: Int?
    
    @State private var chosenPharmacy: Pharmacy
    
    @State private var isOn1: Bool = true
    @State private var isOn2: Bool = false
    
    init(chosenPharmacy: Pharmacy) {
        _chosenPharmacy = State(wrappedValue: chosenPharmacy)
    }
    
    var body: some View {
        
        let on1 = Binding<Bool>(get: { self.isOn1 }, set: { self.isOn1 = $0; self.isOn2.toggle() })
        let on2 = Binding<Bool>(get: { self.isOn2 }, set: { self.isOn1.toggle(); self.isOn2 = $0 })
        
        VStack(spacing: 0) {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Text("New Prescription Request").font(.headline)
            
            Form {
                Text("Do you have a written prescription?").font(.subheadline)
                
                Section {
                    Toggle(isOn: on1) { Text("I have a written prescription. I will mail it to the pharmacy. ").font(.callout) }
                    Toggle(isOn: on2) { Text("I do not have a written prescription. My doctor will call or fax the pharmacy. ").font(.callout) }
                }
                
                if isOn1 == true, isOn2 == false {
                    Section {
                        Text("Pharmacy Name: \(chosenPharmacy.pharmacyName!)")
                        Text("Pharmacy Address: \(chosenPharmacy.address!)")
                        Text("Pharmacy Postal Code: \(chosenPharmacy.postalCode!)")
                    }
                    
                } else if isOn1 == false, isOn2 == true {
                    Section {
                        Text("Pharmacy Phone: \(chosenPharmacy.phoneNumber!)")
                        Text("Pharmacy Fax: \(chosenPharmacy.faxNumber!)")
                    }
                }
            }
            
            
            Button(action: {
                self.selection = 0
            } ) { Text("< Back").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
            .background(Color(UIColor.gradiant1))
                .padding()
            
            Button(action: {
                self.selection = 1
            } ) { Text("Next >").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.mainColor))
                .padding()
            
            NavigationLink(destination: NewPrescriptionMessage(chosenPharmacy: chosenPharmacy), tag: 0, selection: $selection) { EmptyView() }
            NavigationLink(destination: FulfillmentView(chosenPharmacy: chosenPharmacy, indicator: 2), tag: 1, selection: $selection) { EmptyView() }

            
        }
    }
}
