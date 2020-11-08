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
    @State var email: String = ""

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
                        .foregroundColor(Color(index == 0 ? UIColor.lightGreen : .lightGray))
                        .frame(height: 5)
                }
            }
                .padding()
            
            Form {
                Section {
                    TextField("Full Name", text: $fullName)
                }
                Section {
                    
                    TextField("Address", text: $address)
                    TextField("Province", text: $province)
                    TextField("Postal Code", text: $postalCode)
                    TextField("Phone", text: $phoneNumber)
                    TextField("Email", text: $email)
                    
                }
            }
            
            Spacer()
            Button(action: {
                self.selection = 1
            } ) { Text("Next >").font(.body).bold() }
                .disabled(fullName.isEmpty || address.isEmpty || province.isEmpty || postalCode.isEmpty || phoneNumber.isEmpty || email.isEmpty)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(fullName.isEmpty || address.isEmpty || province.isEmpty || postalCode.isEmpty || phoneNumber.isEmpty || email.isEmpty ? .gray : Color(UIColor.mainColor))
                .padding()
                
                NavigationLink(destination: HealthProfileView1(), tag: 1, selection: $selection) { EmptyView() }
            
        }
    }
}
