//
//  AdminView.swift
//  InstantCredit
//
//  Created by ENRAG3DCHICKEN on 2020-10-15.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct AdminHomeView: View {
    
    @State var selection: Int?
    
    var body: some View {
        
        
        VStack {
                    
            NavigationLink(destination: LogoView(), tag: 0, selection: $selection) { EmptyView() }
                
            Button(action: {
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: "password")
                self.selection = 0
            }) { Text("Logout").font(.caption) }
        }
        
        
        
        
    }
}


