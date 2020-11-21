//
//  InsuranceView3.swift
//  InstantCredit
//
//  Created by Jackie Yiu on 11/6/20.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct InsuranceView3: View {

    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    @State var selection: Int?

    @Binding var billToInsuranceFlag1: Bool
    @Binding var billToInsuranceFlag2: Bool
    @Binding var billToInsuranceFlag3: Bool

    @Binding var selectedPlanName1: String
    @Binding var selectedPlanName2: String
    @Binding var selectedPlanName3: String

    @State private var memberID3: String = ""
    @State private var groupNumber3: String = ""
    @State private var policyholderName3: String = ""
    @State private var carrierCode3: String = ""
    @State private var selectedDate3 = Date()
    @State private var insurancePhone3: String = ""
    @State private var relationshipToCardholder3: String = ""
    
    init(billToInsuranceFlag1: Binding<Bool>, billToInsuranceFlag2: Binding<Bool>, billToInsuranceFlag3: Binding<Bool>, selectedPlanName1: Binding<String>, selectedPlanName2: Binding<String>, selectedPlanName3: Binding<String>) {
        _billToInsuranceFlag1 = billToInsuranceFlag1
        _billToInsuranceFlag2 = billToInsuranceFlag2
        _billToInsuranceFlag3 = billToInsuranceFlag3
        
        _selectedPlanName1 = selectedPlanName1
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
                ForEach(0..<8) { index in
                    Rectangle()
                        .foregroundColor(Color(index <= 5 ? UIColor.lightGreen : .lightGray))
                        .frame(height: 5)
                }
            }
                .padding()
            
            Form {
                if selectedPlanName3 != "" {
                    Section(header: Text("Insurance Details")) {
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
                .padding()
            
            
            Spacer()
            Button(action: {
                
                self.selection = 3
                
                UserDefaults.standard.set(self.memberID3, forKey: "memberID3")
                UserDefaults.standard.set(self.groupNumber3, forKey: "groupNumber3")
                UserDefaults.standard.set(self.policyholderName3, forKey: "policyholderName3")
                UserDefaults.standard.set(self.carrierCode3, forKey: "carrierCode3")
                UserDefaults.standard.set(self.selectedDate3, forKey: "selectedDate3")
                UserDefaults.standard.set(self.insurancePhone3, forKey: "insurancePhone3")
                UserDefaults.standard.set(self.relationshipToCardholder3, forKey: "relationshipToCardholder3")
                
            } ) { Text("Next >").font(.body).bold() }
                .disabled(memberID3.isEmpty || groupNumber3.isEmpty || policyholderName3.isEmpty || carrierCode3.isEmpty || insurancePhone3.isEmpty || relationshipToCardholder3.isEmpty)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(memberID3.isEmpty || groupNumber3.isEmpty || policyholderName3.isEmpty || carrierCode3.isEmpty || insurancePhone3.isEmpty || relationshipToCardholder3.isEmpty ? .gray : Color(UIColor.mainColor))
                .padding()
        
    
        NavigationLink(destination: PaymentView(), tag: 3, selection: $selection) { EmptyView() }
            
            }
    }
}

