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
    
        @State var selectedPlanName: String = ""
        
        
        var body: some View {
                VStack {
                    
                    
                    TextField("OHIP Number", text: $OHIP)
                    Toggle(isOn: self.$billToInsuranceFlag) { Text("Would you like us to bill a prescription insurance provider?") }
                    
                    Picker(selection: $selectedPlanName, label: Text("Plan")) {
                        ForEach(0..<planNameSelections.count) { index in
                            Text(planNameSelections[index])
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: InsuranceView2(), tag: 1, selection: $selection) { Text("") }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                    
                }
            }
        }

