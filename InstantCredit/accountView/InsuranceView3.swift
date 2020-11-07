//
//  InsuranceView3.swift
//  InstantCredit
//
//  Created by Jackie Yiu on 11/6/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct InsuranceView3: View {
    
    @State var selection: Int?

    @Binding var billToInsuranceFlag: Bool
    @Binding var billToInsuranceFlag2: Bool
    @Binding var billToInsuranceFlag3: Bool

    @Binding var selectedPlanName: String
    @Binding var selectedPlanName2: String
    @Binding var selectedPlanName3: String

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
            
            Form{
                if selectedPlanName3 != "" {
                    Section {
                        Text(selectedPlanName3)
                        TextField("Member ID", text: $memberID3)
                        TextField("Group #", text: $groupNumber3)
                        TextField("Policyholder Name", text: $policyholderName3)
                        TextField("Carrier Code", text: $carrierCode3)
                        DatePicker("Date of Birth", selection: $selectedDate3, displayedComponents: .date)
                        TextField("Insurance Phone Number", text: $insurancePhone3)
                        Picker(selection: $relationshipToCardholder3, label: Text("Relationship To Cardholder")) {
                            ForEach(0..<relationshipToCardholder.count) { index in
                                Text(relationshipToCardholder[index]).tag(relationshipToCardholder[index])
                            }
                        }
                    }
                }
            }
        
    
        NavigationLink(destination: ShippingView(), tag: 3, selection: $selection) { EmptyView() }
            
        Button(action: {
            self.selection = 3
        }) { Text("Next").font(.caption) }
            }
    }
}

