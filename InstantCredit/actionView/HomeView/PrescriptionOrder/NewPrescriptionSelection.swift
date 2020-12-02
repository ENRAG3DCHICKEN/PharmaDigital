//
//  NewPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/9/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct NewPrescriptionSelection: View {
    
    @State private var chosenPharmacy: Pharmacy
    
    @State private var isOn1: Bool = true
    @State private var isOn2: Bool = false
    
    init(chosenPharmacy: Pharmacy) {
        _chosenPharmacy = State(wrappedValue: chosenPharmacy)
    }
    
    var body: some View {
        let on1 = Binding<Bool>(get: { self.isOn1 }, set: { self.isOn1 = $0; self.isOn2 = false})
        let on2 = Binding<Bool>(get: { self.isOn2 }, set: { self.isOn1 = false; self.isOn2 = $0})
        
        VStack {

            Text("Do you have a written prescription?")
            
            Toggle(isOn: on1) { Text("I have a written prescription. I will mail it to the pharmacy. ").font(.callout) }
            Toggle(isOn: on2) { Text("I do not have a written prescription. My doctor will call or fax the pharmacy. ").font(.callout) }
            
            if isOn1 == true, isOn2 == false {
                Form {
                    Section {
                        Text("Pharmacy Name: \(chosenPharmacy.pharmacyName!)")
                        Text("Pharmacy Address: \(chosenPharmacy.address!)")
                        Text("Pharmacy Postal Code: \(chosenPharmacy.postalCode!)")
                    }
                }
            } else if isOn1 == false, isOn2 == true {
                VStack {
                    Text("Pharmacy Phone: \(chosenPharmacy.phoneNumber)")
                    Text("Pharmacy Fax: \(chosenPharmacy.faxNumber)")
                }
            }
        }
    }
}
