//
//  HealthProfileView3.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct HealthProfileView3: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    @State var selection: Int?
    
    @State var medicalConditionsFlag: Bool = false
    @State var conditionsListFlag: [Bool] = Array(repeating: false, count: conditionsListExOther.count)
    @State var otherMedicalConditions: String = ""

    
    
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
                            .foregroundColor(Color(index <= 3 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                
                Form {
                    Section(header: Text("Health Profile")) {
                        HStack {
                            Toggle(isOn: $medicalConditionsFlag) { Text("Do you have any medical conditions?") }
                            Text(medicalConditionsFlag ? "Yes" : "No")
                        }
                        if medicalConditionsFlag == true {
                            List {
                                Section {
                                    ForEach(0..<conditionsListExOther.count) { index in
                                        HStack {
                                            Toggle(isOn: self.$conditionsListFlag[index]) { Text(conditionsListExOther[index]) }
                                            Text(self.conditionsListFlag[index] ? "Yes" : "No")
                                        }
                                    }
                                }
                                TextField("List Other Medical Conditions", text: self.$otherMedicalConditions)
                            }
                                
                        }
                    }
                }
                .padding()
                
                Spacer()
                Button(action: {
                    
                    self.selection = 1
                    
                    UserDefaults.standard.set(self.medicalConditionsFlag, forKey: "medicalConditionsFlag")
                    UserDefaults.standard.set(self.conditionsListFlag, forKey: "conditionsListFlag")
                    UserDefaults.standard.set(self.otherMedicalConditions, forKey: "otherMedicalConditions")
                    
                } ) { Text("Next >").font(.body).bold() }
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.mainColor))
                    .padding()
            
                NavigationLink(destination: InsuranceView(), tag: 1, selection: $selection) { EmptyView() }
            }
        }
    }
