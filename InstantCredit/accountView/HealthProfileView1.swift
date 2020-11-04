//
//  HealthProfileView1.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct HealthProfileView1: View {

    @State var selection: Int?
    
    @State var selectedDate = Date()
    @State var substituteGeneric: Bool = true
    @State var selectedGender: String
    
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
                    Toggle(isOn: self.$substituteGeneric) { Text("Gender") }
                    
                    // Date Picker
                    if #available(iOS 14.0, *) {
                        DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    } else {
                        DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)
                    }
                    
                    Picker(selection: $selectedGender, label: Text("Gender")) {
                        ForEach(0..<genderSelections.count) { index in
                            Text(genderSelections[index]).tag(genderSelections[index])
                        }
                    }
                }
                    
                
                
                
                
                
                
                NavigationLink(destination: HealthProfileView2(), tag: 1, selection: $selection) { EmptyView() }
                    
                Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                
            }
        }
    }
