//
//  PrivacyView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-12.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct PrivacyView: View {
        @State var selection: Int?
        
        var body: some View {

                VStack {
                    NavigationLink(destination: InsuranceView(), tag: 1, selection: $selection) { EmptyView() }
                        
                    Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                    
                }
            
        }
    }
struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
