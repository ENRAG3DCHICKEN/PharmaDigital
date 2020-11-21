//
//  InsuranceView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import CoreData

struct InsuranceView: View {
    
        @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
        @State var selection: Int?
    
        @State var OHIP: String = ""
    
        @State var billToInsuranceFlag1: Bool = false
        @State var billToInsuranceFlag2: Bool = false
        @State var billToInsuranceFlag3: Bool = false
    
        @State var selectedPlanName1: String = ""
        @State var selectedPlanName2: String = ""
        @State var selectedPlanName3: String = ""
        
        
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
                            .foregroundColor(Color(index <= 4 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                Form {
                    Section(header: Text("Insurance Details")) {
                        TextField("OHIP Number", text: $OHIP)
                        
                        Section {
                            Toggle(isOn: self.$billToInsuranceFlag1) { Text("Would you like us to bill a prescription insurance provider?").font(.callout) }
                            
                            if billToInsuranceFlag1 == true {
                                Picker(selection: $selectedPlanName1, label: Text("Plan")) {
                                    ForEach(0..<planNameSelections.count) { index in
                                        Text(planNameSelections[index]).tag(planNameSelections[index])
                                    }
                                }
                            }
                        }
                        
                        Section {
                            if selectedPlanName1 != "" {
                                Toggle(isOn: self.$billToInsuranceFlag2) { Text("Would you like us to bill another prescription insurance provider?").font(.callout) }
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
                                Toggle(isOn: self.$billToInsuranceFlag3) { Text("Would you like us to bill another prescription insurance provider?").font(.callout) }
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
                }
                    .padding()
                    
                    
                
                Spacer()
                Button(action: {
                    
                    if selectedPlanName1 != "" {
                        self.selection = 1
                    } else if selectedPlanName1 == "" {
                        self.selection = 2
                    }
                    
                    UserDefaults.standard.set(self.OHIP, forKey: "OHIP")
                    UserDefaults.standard.set(self.billToInsuranceFlag1, forKey: "billToInsuranceFlag")
                    UserDefaults.standard.set(self.billToInsuranceFlag2, forKey: "billToInsuranceFlag2")
                    UserDefaults.standard.set(self.billToInsuranceFlag3, forKey: "billToInsuranceFlag3")
                    UserDefaults.standard.set(self.selectedPlanName1, forKey: "selectedPlanName")
                    UserDefaults.standard.set(self.selectedPlanName2, forKey: "selectedPlanName2")
                    UserDefaults.standard.set(self.selectedPlanName3, forKey: "selectedPlanName3")
                    
                } ) { Text("Next >").font(.body).bold() }
                    .disabled(OHIP.isEmpty)
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background(OHIP.isEmpty ? .gray : Color(UIColor.mainColor))
                    .padding()
                                        
                NavigationLink(destination: InsuranceView1(billToInsuranceFlag1: $billToInsuranceFlag1, billToInsuranceFlag2: $billToInsuranceFlag2, billToInsuranceFlag3: $billToInsuranceFlag3, selectedPlanName1: $selectedPlanName1, selectedPlanName2: $selectedPlanName2, selectedPlanName3: $selectedPlanName3), tag: 1, selection: $selection) { EmptyView() }
                
                NavigationLink(destination: PaymentView(), tag: 2, selection: $selection) { EmptyView() }
                        
                        
                    
                
                    
                }
            }
        }

struct Insurance_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceView()
    }
}
