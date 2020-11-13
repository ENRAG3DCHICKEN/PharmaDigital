//
//  PatientInfoView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI
import Firebase

struct PatientInfoView: View {

    @State var selection: Int?
    
    @State var fullName: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var province: String = ""
    @State var postalCode: String = ""
    @State var phoneNumber: String = ""

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
                  
            Section {
                HStack {
                    ForEach(0..<9) { index in
                        Rectangle()
                            .foregroundColor(Color(index == 0 ? UIColor.lightGreen : .lightGray))
                            .frame(height: 5)
                    }
                }
                    .padding()
            }
            
            Form {
                Section(header: Text("Patient Info")) {
                    TextField("Full Name", text: $fullName)
                    TextField("Address", text: $address)
                    Picker(selection: $province, label: Text("Province")) {
                        ForEach(0..<provinces.count) { index in
                            Text(provinces[index]).tag(provinces[index])
                        }
                    }
                    TextField("Postal Code", text: $postalCode)
                    TextField("Phone", text: $phoneNumber)

                }
            }
                .padding()
            
            Spacer()
            Button(action: {
                //Store into Core Data
                
                
                
                
                self.selection = 1
                
                
                
            } ) { Text("Next >").font(.body).bold() }
                .disabled(fullName.isEmpty || address.isEmpty || province.isEmpty || postalCode.isEmpty || phoneNumber.isEmpty)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(fullName.isEmpty || address.isEmpty || province.isEmpty || postalCode.isEmpty || phoneNumber.isEmpty ? .gray : Color(UIColor.mainColor))
                .padding()
                
                NavigationLink(destination: HealthProfileView1(), tag: 1, selection: $selection) { EmptyView() }
            
        }
    }
}
