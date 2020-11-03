//
//  HealthProfileView1.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-13.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct HealthProfileView1: View {
    
    @State var selection: Int?
    
    var body: some View {
            VStack {
   
                NavigationLink(destination: HealthProfileView2(), tag: 1, selection: $selection) { EmptyView() }
                    
                Button(action: { self.selection = 1 }) { Text("Next").font(.caption) }
                
            }
        }
    }
