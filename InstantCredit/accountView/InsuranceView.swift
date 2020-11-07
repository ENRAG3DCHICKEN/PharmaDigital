//
//  InsuranceView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct InsuranceView: View {
        @State var selection: Int?
    
        @State var OHIP: String = ""
    
        @State var billToInsuranceFlag: Bool = false
        @State var billToInsuranceFlag2: Bool = false
        @State var billToInsuranceFlag3: Bool = false
    
        @State var selectedPlanName: String = ""
        @State var selectedPlanName2: String = ""
        @State var selectedPlanName3: String = ""
        
        
        var body: some View {
            VStack {
                
                Text("")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                HStack {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .foregroundColor(Color(index == 4 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                Form {
                    
                    TextField("OHIP Number", text: $OHIP)
                    
                    Section {
                        Toggle(isOn: self.$billToInsuranceFlag) { Text("Would you like us to bill a prescription insurance provider?") }
                        
                        if billToInsuranceFlag == true {
                            Picker(selection: $selectedPlanName, label: Text("Plan")) {
                                ForEach(0..<planNameSelections.count) { index in
                                    Text(planNameSelections[index]).tag(planNameSelections[index])
                                }
                            }
                        }
                    }
                    
                    Section {
                        if selectedPlanName != "" {
                            Toggle(isOn: self.$billToInsuranceFlag2) { Text("Would you like us to bill another prescription insurance provider?") }
                        }
                        
                        if billToInsuranceFlag2 == true {
                            Picker(selection: $selectedPlanName2, label: Text("Plan")) {
                                ForEach(0..<planNameSelections.count) { index in
                                    Text(planNameSelections[index]).tag(planNameSelections[index])
                                }
                            }
                        }
                    }
                    
                    Section {
                        if selectedPlanName2 != "" {
                            Toggle(isOn: self.$billToInsuranceFlag3) { Text("Would you like us to bill another prescription insurance provider?") }
                        }
                        
                        if billToInsuranceFlag3 == true {
                            Picker(selection: $selectedPlanName3, label: Text("Plan")) {
                                ForEach(0..<planNameSelections.count) { index in
                                    Text(planNameSelections[index]).tag(planNameSelections[index])
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                NavigationLink(destination: InsuranceView1(billToInsuranceFlag: $billToInsuranceFlag, billToInsuranceFlag2: $billToInsuranceFlag2, billToInsuranceFlag3: $billToInsuranceFlag3, selectedPlanName: $selectedPlanName, selectedPlanName2: $selectedPlanName2, selectedPlanName3: $selectedPlanName3), tag: 1, selection: $selection) { EmptyView() }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                
                    
                }
            }
        }

struct Insurance_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceView()
    }
}
