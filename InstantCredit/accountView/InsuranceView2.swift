//
//  InsuranceView2.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct InsuranceView2: View {
    
        @State var selection: Int?
    
        @Binding var billToInsuranceFlag: Bool
        @Binding var billToInsuranceFlag2: Bool
        @Binding var billToInsuranceFlag3: Bool

        @Binding var selectedPlanName: String
        @Binding var selectedPlanName2: String
        @Binding var selectedPlanName3: String
    
        @State private var memberID1: String = ""
        @State private var groupNumber1: String = ""
        @State private var policyholderName1: String = ""
        @State private var carrierCode1: String = ""
        @State private var selectedDate1 = Date()
        @State private var insurancePhone1: String = ""
        @State private var relationshipToCardholder1: String = ""

        @State private var memberID2: String = ""
        @State private var groupNumber2: String = ""
        @State private var policyholderName2: String = ""
        @State private var carrierCode2: String = ""
        @State private var selectedDate2 = Date()
        @State private var insurancePhone2: String = ""
        @State private var relationshipToCardholder2: String = ""

        @State private var memberID3: String = ""
        @State private var groupNumber3: String = ""
        @State private var policyholderName3: String = ""
        @State private var carrierCode3: String = ""
        @State private var selectedDate3 = Date()
        @State private var insurancePhone3: String = ""
        @State private var relationshipToCardholder3: String = ""

        init(billToInsuranceFlag: Binding<Bool>, billToInsuranceFlag2: Binding<Bool>, billToInsuranceFlag3: Binding<Bool>, selectedPlanName: Binding<String>, selectedPlanName2: Binding<String>, selectedPlanName3: Binding<String>) {
            _billToInsuranceFlag = billToInsuranceFlag
            _billToInsuranceFlag2 = billToInsuranceFlag2
            _billToInsuranceFlag3 = billToInsuranceFlag3
            
            _selectedPlanName = selectedPlanName
            _selectedPlanName2 = selectedPlanName2
            _selectedPlanName3 = selectedPlanName3
        }
        
        var body: some View {
                VStack {
                    
                    Text("")
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    HStack {
                        ForEach(0..<10) { index in
                            Rectangle()
                                .foregroundColor(Color(index == 5 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    if selectedPlanName != "" {
                        Section {
                            Text(selectedPlanName)
                            TextField("Member ID", text: $memberID1)
                            TextField("Group #", text: $groupNumber1)
                            TextField("Policyholder Name", text: $policyholderName1)
                            TextField("Carrier Code", text: $carrierCode1)
                            DatePicker("Date of Birth", selection: $selectedDate1, displayedComponents: .date)
                            TextField("Insurance Phone Number", text: $insurancePhone1)
                            TextField("Relationship to Cardholder", text: $relationshipToCardholder1)
                        }
                    }
                     
                    if selectedPlanName2 != "" {
                        Section {
                            Text(selectedPlanName2)
                            TextField("Member ID", text: $memberID2)
                            TextField("Group #", text: $groupNumber2)
                            TextField("Policyholder Name", text: $policyholderName2)
                            TextField("Carrier Code", text: $carrierCode2)
                            DatePicker("Date of Birth", selection: $selectedDate2, displayedComponents: .date)
                            TextField("Insurance Phone Number", text: $insurancePhone2)
                            TextField("Relationship to Cardholder", text: $relationshipToCardholder2)
                        }
                    }
                        
                    if selectedPlanName3 != "" {
                        Section {
                            Text(selectedPlanName3)
                            TextField("Member ID", text: $memberID3)
                            TextField("Group #", text: $groupNumber3)
                            TextField("Policyholder Name", text: $policyholderName3)
                            TextField("Carrier Code", text: $carrierCode3)
                            DatePicker("Date of Birth", selection: $selectedDate3, displayedComponents: .date)
                            TextField("Insurance Phone Number", text: $insurancePhone3)
                            TextField("Relationship to Cardholder", text: $relationshipToCardholder3)
                        }
                    }
                    
                    
                    
                    
                    NavigationLink(destination: ShippingView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                    
                }
            }
        }
