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
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var address1: String = ""
    @State var address2: String = ""
    @State var city: String = ""
    @State var province: String = ""
    @State var postalCode: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""

    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Address-1", text: $address1)
                    TextField("Address-2", text: $address2)
                    TextField("Province", text: $province)
                    TextField("Postal Code", text: $postalCode)
                    TextField("Phone", text: $phoneNumber)
                    TextField("Email", text: $email)
                    
                    NavigationLink(destination: HealthProfileView1(), tag: 1, selection: $selection) { Text("") }
                        
                    Button(action: { self.selection = 1 } ) { Text("Next").font(.caption) }
                    
                }
            }
        }
    }
}
