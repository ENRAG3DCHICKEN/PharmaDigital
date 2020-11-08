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
                                .foregroundColor(Color(index == 8 ? UIColor.lightGreen : .lightGray))
                                .frame(height: 5)
                        }
                    }
                        .padding()
                    
                    Spacer()
                    Button(action: { self.selection = 1 } ) { Text("Next >").font(.body).bold() }
                        .frame(width: UIScreen.main.bounds.width * 0.92, height: 35)
                        .foregroundColor(Color(.white))
                        .background(Color(UIColor.mainColor))
                        .padding()
                    
                    NavigationLink(destination: UserHomeView(), tag: 1, selection: $selection) { EmptyView() }
                    
                }
            
        }
    }
struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
