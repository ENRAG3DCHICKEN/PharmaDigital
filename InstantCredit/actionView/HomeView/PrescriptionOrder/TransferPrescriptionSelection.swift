//
//  TransferPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct TransferPrescriptionSelection: View {
    @State private var isOn1: Bool = true
    @State private var isOn2: Bool = false
    
    @State private var priorPharmacyName: String = ""
    @State private var priorPharmacyPhone: String = ""
    
    @State private var rx1: String = ""
    @State private var med1: String = ""
    @State private var rx2: String = ""
    @State private var med2: String = ""
    @State private var rx3: String = ""
    @State private var med3: String = ""
    @State private var rx4: String = ""
    @State private var med4: String = ""
    @State private var rx5: String = ""
    @State private var med5: String = ""
    @State private var rx6: String = ""
    @State private var med6: String = ""
    
    
    @State private var PharmacyPhone = ""
    @State private var PharmacyFax = ""
    
    
    init() {
        //Replace this with a core data pull
        _PharmacyPhone = State(wrappedValue: "")
        _PharmacyFax = State(wrappedValue: "")
    }
    
    var body: some View {
        let on1 = Binding<Bool>(get: { self.isOn1 }, set: { self.isOn1 = $0; self.isOn2 = false})
        let on2 = Binding<Bool>(get: { self.isOn2 }, set: { self.isOn1 = false; self.isOn2 = $0})
        
        VStack {

            
            Toggle(isOn: on1) { Text("My prescription will be transferred based on the below details: ").font(.callout) }
            Toggle(isOn: on2) { Text("My old pharmacy will call or fax").font(.callout) }
            
            if isOn1 == true, isOn2 == false {
                Form {
                    Section {
                        TextField("Pharmacy Name", text: $priorPharmacyName)
                        TextField("Pharmacy Phone", text: $priorPharmacyPhone)
                    }
                    Section {
                        HStack {
                            TextField("Prescription #: ", text: $rx1)
                            TextField("Medication: ", text: $med1)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx2)
                            TextField("Medication: ", text: $med2)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx3)
                            TextField("Medication: ", text: $med3)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx4)
                            TextField("Medication: ", text: $med4)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx4)
                            TextField("Medication: ", text: $med4)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx5)
                            TextField("Medication: ", text: $med5)
                        }
                        HStack {
                            TextField("Prescription #: ", text: $rx6)
                            TextField("Medication: ", text: $med6)
                        }
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
