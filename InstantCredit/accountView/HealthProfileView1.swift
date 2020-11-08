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
    @State var selectedGender: String = ""
    
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
                    ForEach(0..<9) { index in
                        Rectangle()
                            .foregroundColor(Color(index == 1 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                Form {
                    Toggle(isOn: self.$substituteGeneric) { Text("Yes, Substitute a generic equivalent when available").font(.callout) }
                    
                    Section {
                        DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)

                        }
                    
                    
                    Picker(selection: $selectedGender, label: Text("Gender")) {
                        ForEach(0..<genderSelections.count) { index in
                            Text(genderSelections[index]).tag(genderSelections[index])
                        }
                    }
                }
                
                Spacer()
                Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.mainColor))
                    .padding()
                    
                    NavigationLink(destination: HealthProfileView2(), tag: 1, selection: $selection) { EmptyView() }
            }
        }
    }

