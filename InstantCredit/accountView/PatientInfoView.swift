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
            HStack {
                ForEach(0..<10) { index in
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
                
                Button(action: { self.selection = 1 } ) { Text("Next").font(.caption) }
                
                NavigationLink(destination: HealthProfileView1(), tag: 1, selection: $selection) { EmptyView() }
                    
                
            
        }
    }
}
