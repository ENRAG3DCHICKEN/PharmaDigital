//
//  InsuranceView2.swift
//  InstantCredit
//
//  Created by Jackie Yiu on 11/6/20.
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
    
    @State private var memberID2: String = ""
    @State private var groupNumber2: String = ""
    @State private var policyholderName2: String = ""
    @State private var carrierCode2: String = ""
    @State private var selectedDate2 = Date()
    @State private var insurancePhone2: String = ""
    @State private var relationshipToCardholder2: String = ""
    
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
            
            Image("cropped-img7")
                .resizable()
                .frame(height: UIScreen.main.bounds.height * 0.2)
                .overlay(
                    Text("Help us match you to the right counselor.")
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .opacity(0.7)
                )
                  
            
            HStack {
                ForEach(0..<10) { index in
                    Rectangle()
                        .foregroundColor(Color(index == 5 ? UIColor.lightGreen : .lightGray))
                        .frame(height: 5)
                }
            }
                .padding()
            
            Form {
             
                if selectedPlanName2 != "" {

                    Section {
                        Text(selectedPlanName2)
                        TextField("Member ID", text: $memberID2)
                        TextField("Group #", text: $groupNumber2)
                        TextField("Policyholder Name", text: $policyholderName2)
                        TextField("Carrier Code", text: $carrierCode2)
                        DatePicker("Date of Birth", selection: $selectedDate2, displayedComponents: .date)
                        TextField("Insurance Phone Number", text: $insurancePhone2)
                        Picker(selection: $relationshipToCardholder2, label: Text("Relationship To Cardholder")) {
                            ForEach(0..<relationshipToCardholder.count) { index in
                                Text(relationshipToCardholder[index]).tag(relationshipToCardholder[index])
                            }
                        }
                    }
                }
            }
            
            Spacer()
            Button(action: {
                if selectedPlanName3 != "" {
                    self.selection = 1
                } else if selectedPlanName3 == "" {
                    self.selection = 2
                }
            } ) { Text("Next >").font(.body).bold() }
            .disabled(memberID2.isEmpty || groupNumber2.isEmpty || policyholderName2.isEmpty || carrierCode2.isEmpty || insurancePhone2.isEmpty || relationshipToCardholder2.isEmpty)
            .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
            .foregroundColor(Color(.white))
            .background(memberID2.isEmpty || groupNumber2.isEmpty || policyholderName2.isEmpty || carrierCode2.isEmpty || insurancePhone2.isEmpty || relationshipToCardholder2.isEmpty ? .gray : Color(UIColor.mainColor))
            .padding()
            
            NavigationLink(destination: InsuranceView3(billToInsuranceFlag: $billToInsuranceFlag, billToInsuranceFlag2: $billToInsuranceFlag2, billToInsuranceFlag3: $billToInsuranceFlag3, selectedPlanName: $selectedPlanName, selectedPlanName2: $selectedPlanName2, selectedPlanName3: $selectedPlanName3), tag: 1, selection: $selection) { EmptyView() }
            NavigationLink(destination: ShippingView(), tag: 2, selection: $selection) { EmptyView() }
                
            
        }
    }
        
}
