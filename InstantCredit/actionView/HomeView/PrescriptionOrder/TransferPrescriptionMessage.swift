//
//  TransferPrescriptionMessage.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-11-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct TransferPrescriptionMessage: View {
    
    @State private var selection: Int?

    var body: some View {
        VStack {
            
            Text("")
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
            Text("Only place transfer requests now for prescriptions you wish to have filled at this time")
            Text("Please place your orders for future prescriptions near the time you wish to have them shipped")
            
            Spacer()
            
            Button(action: {
                self.selection = 1
            } ) { Text("Next >").font(.body).bold() }
                .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                .foregroundColor(Color(.white))
                .background(Color(UIColor.mainColor))
                .padding()
            
            NavigationLink(destination: TransferPrescriptionSelection(), tag: 1, selection: $selection) { EmptyView() }
            
        }
    }
}


