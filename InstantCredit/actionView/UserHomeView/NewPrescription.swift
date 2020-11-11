//
//  NewPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DMINX on 11/9/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct NewPrescription: View {
    @State private var isOn1: Bool = true
    @State private var isOn2: Bool = false
    
    @State private var PharmacyName: String
    @State private var PharmacyAddress: String
    @State private var PharmacyPostalCode: String
    
    @State private var PharmacyPhone: String
    @State private var PharmacyFax: String
    
    init() {
        //Replace this with a core data pull
        _PharmacyName = State(wrappedValue: "")
        _PharmacyAddress = State(wrappedValue: "")
        _PharmacyPostalCode = State(wrappedValue: "")
        _PharmacyPhone = State(wrappedValue: "")
        _PharmacyFax = State(wrappedValue: "")
    }
    
    var body: some View {
        let on1 = Binding<Bool>(get: { self.isOn1 }, set: { self.isOn1 = $0; self.isOn2 = false})
        let on2 = Binding<Bool>(get: { self.isOn2 }, set: { self.isOn1 = false; self.isOn2 = $0})
        
        VStack {
            Text("Only place transfer requests now for prescriptions you wish to have filled at this time")
            Text("Please place your orders for future prescriptions near the time you wish to have them shipped")
            
            Toggle(isOn: on1) { Text("I have a written prescription. I will mail it to the pharmacy. ").font(.callout) }
            Toggle(isOn: on2) { Text("I do not have a written prescription. My doctor will call or fax the pharmacy. ").font(.callout) }
            
            if isOn1 == true, isOn2 == false {
                Form {
                    Section {
                        TextField("Pharmacy Name", text: $PharmacyName)
                        TextField("Pharmacy Address", text: $PharmacyAddress)
                        TextField("Pharmacy Postal Code", text: $PharmacyPostalCode)
                    }
                }
                
                
            } else if isOn1 == false, isOn2 == true {
                VStack {
                    Text("Phone: \(PharmacyPhone)")
                    Text("Fax: \(PharmacyFax)")
                }
            }
            
        }
    }
}

struct NewPrescription_Previews: PreviewProvider {
    static var previews: some View {
        NewPrescription()
    }
}
