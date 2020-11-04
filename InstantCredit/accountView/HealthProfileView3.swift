//
//  HealthProfileView3.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct HealthProfileView3: View {
    
    @State var selection: Int?
    
    @State var medicalConditionsFlag: Bool = false
    @State var conditionsListFlag: [Bool] = Array(repeating: false, count: conditionsListExOther.count)
    @State var otherMedicalConditions: String = ""

    
    
    var body: some View {
            VStack {
                
                HStack {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .foregroundColor(Color(index == 0 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                
                Form {
                    HStack {
                        Toggle(isOn: $medicalConditionsFlag) { Text("Do you have any medical conditions?") }
                        Text(medicalConditionsFlag ? "Yes" : "No")
                    }
                    if medicalConditionsFlag == true {
                        List {
                            ForEach(0..<conditionsListExOther.count) { index in
                                HStack {
                                    Toggle(isOn: self.$conditionsListFlag[index]) { Text(conditionsListExOther[index]) }
                                    Text(self.conditionsListFlag[index] ? "Yes" : "No")
                                }
                            }
                            TextField("List Other Medical Conditions", text: self.$otherMedicalConditions)
                        }
                            
                    }
                }
            
                NavigationLink(destination: InsuranceView(), tag: 1, selection: $selection) { EmptyView() }
                    
                Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                
            }
        }
    }
