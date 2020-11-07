//
//  InsuranceView2.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct InsuranceView1: View {
    
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
                    
                    Form {
                    
                        if selectedPlanName != "" {

                                Section {
                                    Text(selectedPlanName)
                                    TextField("Member ID", text: $memberID1)
                                    TextField("Group #", text: $groupNumber1)
                                    TextField("Policyholder Name", text: $policyholderName1)
                                    TextField("Carrier Code", text: $carrierCode1)
                                    DatePicker("Date of Birth", selection: $selectedDate1, displayedComponents: .date)
                                    TextField("Insurance Phone Number", text: $insurancePhone1)
                                    Picker(selection: $relationshipToCardholder1, label: Text("Relationship To Cardholder")) {
                                        ForEach(0..<relationshipToCardholder.count) { index in
                                            Text(relationshipToCardholder[index]).tag(relationshipToCardholder[index])
                                        }
                                    }
                                }
                            }


                        
                    }
                    
                    
                    NavigationLink(destination: InsuranceView2(billToInsuranceFlag: $billToInsuranceFlag, billToInsuranceFlag2: $billToInsuranceFlag2, billToInsuranceFlag3: $billToInsuranceFlag3, selectedPlanName: $selectedPlanName, selectedPlanName2: $selectedPlanName2, selectedPlanName3: $selectedPlanName3), tag: 1, selection: $selection) { EmptyView() }
                    NavigationLink(destination: ShippingView(), tag: 2, selection: $selection) { EmptyView() }
                        
                    Button(action: {
                        print(selectedPlanName2)
                        if selectedPlanName2 != "" {
                            self.selection = 1
                        }
                        else {
                            self.selection = 2
                        }
                        
                    }) { Text("Next").font(.caption) }
                    
                }
            }
        }
