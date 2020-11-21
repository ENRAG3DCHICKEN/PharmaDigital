//
//  HealthProfileView1.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct HealthProfileView1: View {

    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    @State var selection: Int?
    
    @State var birthDate = Date()
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
                    ForEach(0..<8) { index in
                        Rectangle()
                            .foregroundColor(Color(index <= 1 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                Form {
                    Section(header: Text("Health Profile")) {
                        Toggle(isOn: self.$substituteGeneric) { Text("Yes, Substitute a generic equivalent when available").font(.callout) }
                        
                        Section {
                            DatePicker("Date of Birth", selection: $birthDate, displayedComponents: .date)

                            }
                        
                        
                        Picker(selection: $selectedGender, label: Text("Gender")) {
                            ForEach(0..<genderSelections.count) { index in
                                Text(genderSelections[index]).tag(genderSelections[index])
                            }
                        }
                    }
                }
                    .padding()
                
                Spacer()
                Button(action: {
                    
                    self.selection = 1
                    
                    UserDefaults.standard.set(self.birthDate, forKey: "birthDate")
                    UserDefaults.standard.set(self.substituteGeneric, forKey: "substituteGender")
                    UserDefaults.standard.set(self.selectedGender, forKey: "selectedGender")
                    
                } ) { Text("Next >").font(.body).bold() }
                    .disabled(selectedGender.isEmpty)
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background(selectedGender.isEmpty ? .gray : Color(UIColor.mainColor))
                    .padding()
                    
                    NavigationLink(destination: HealthProfileView2(), tag: 1, selection: $selection) { EmptyView() }
            }
        }
    }

