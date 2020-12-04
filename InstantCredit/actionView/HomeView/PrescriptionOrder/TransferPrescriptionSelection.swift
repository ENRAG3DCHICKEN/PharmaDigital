//
//  TransferPrescription.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-14.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct TransferPrescriptionSelection: View {
    
    @State private var selection: Int?
    
    @State private var chosenPharmacy: Pharmacy
    
    @State private var isOn1: Bool = true
    @State private var isOn2: Bool = false
   
    
    
    
    @State private var priorPharmacyName: String = ""
    @State private var priorPharmacyPhone: String = ""
    
    @State private var transferAll: Bool = true
    
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
    
    init(chosenPharmacy: Pharmacy) {
        _chosenPharmacy = State(wrappedValue: chosenPharmacy)
    }
    
    var body: some View {
        let on1 = Binding<Bool>(get: { self.isOn1 }, set: { self.isOn1 = $0; self.isOn2.toggle(); self.transferAll = true})
        let on2 = Binding<Bool>(get: { self.isOn2 }, set: { self.isOn1.toggle(); self.isOn2 = $0})
        
        VStack(spacing: 0) {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            
            Text("Transfer Prescription Request").font(.headline)

            Form {
                
                Section {
                    Toggle(isOn: on1) { Text("My prescription will be transferred based on the below details: ").font(.callout) }
                    Toggle(isOn: on2) { Text("My old pharmacy will call or fax").font(.callout) }
                }
                
                
                
                
                if isOn1 == true, isOn2 == false {
                
                    Section {
                        TextField("Old Pharmacy Name", text: $priorPharmacyName)
                        TextField("Old Pharmacy Phone", text: $priorPharmacyPhone)
                    }
                    
                    Toggle(isOn: $transferAll) { Text("Transfer all Medications") }
                    
                    if transferAll == false {
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
                
                    Section {
                        Text("New Pharmacy Phone: \(chosenPharmacy.phoneNumber!)").multilineTextAlignment(.leading)
                        Text("New Pharmacy Fax: \(chosenPharmacy.faxNumber!)").multilineTextAlignment(.leading)
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
                    .disabled( (isOn1 == true && isOn2 == false && priorPharmacyName.isEmpty) || (isOn1 == true && isOn2 == false && priorPharmacyPhone.isEmpty) || (transferAll == false && rx1.isEmpty) || (transferAll == false && med1.isEmpty) )
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background( (isOn1 == true && isOn2 == false && priorPharmacyName.isEmpty) || (isOn1 == true && isOn2 == false && priorPharmacyPhone.isEmpty) || (transferAll == false && rx1.isEmpty) || (transferAll == false && med1.isEmpty) ? .gray : Color(UIColor.mainColor))
                    .padding()
                            
                NavigationLink(destination: TransferPrescriptionMessage(chosenPharmacy: chosenPharmacy), tag: 0, selection: $selection) { EmptyView() }
                NavigationLink(destination: FulfillmentView(), tag: 1, selection: $selection) { EmptyView() }
                
            
        }
    }
}
