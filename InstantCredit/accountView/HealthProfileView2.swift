//
//  HealthProfileView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct HealthProfileView2: View {
    
    @State var selection: Int?
    
    @State var allergiesFlag: Bool = false
    @State var allergiesListFlag: [Bool] = Array(repeating: false, count: allergiesListExOther.count)
    @State var otherAllergies: String = ""
  
    
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
                            .foregroundColor(Color(index == 2 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
                
                Form {
                    Section(header: Text("Health Profile")) {
                        HStack {
                            Toggle(isOn: $allergiesFlag) { Text("Do you have any drug allergies?") }
                            Text(allergiesFlag ? "Yes" : "No")
                        }
            
                        if allergiesFlag == true {
                            List {
                                Section {
                                    ForEach(0..<allergiesListExOther.count) { index in
                                        HStack {
                                            Toggle(isOn: self.$allergiesListFlag[index]) { Text(allergiesListExOther[index]) }
                                            Text(self.allergiesListFlag[index] ? "Yes" : "No")
                                        }
                                    }
                                }
                                TextField("List Other Allergies", text: self.$otherAllergies)
                            }
                        }
                    }
                }
                    .padding()
                
                Spacer()
                Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                    .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                    .foregroundColor(Color(.white))
                    .background(Color(UIColor.mainColor))
                    .padding()
                
                
                NavigationLink(destination: HealthProfileView3(), tag: 1, selection: $selection) { EmptyView() }
            }
        }
    }
