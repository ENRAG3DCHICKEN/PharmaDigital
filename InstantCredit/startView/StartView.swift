//
//  ContentView.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
                VStack(alignment: .center) {
                    Spacer().frame(height: 10)
                    Image("appLogo").resizable()
                            .frame(width: 100, height: 100)
                    Image("appBanner").resizable()
                        .frame(width: 200, height: 100)
                        .scaleEffect(1.5)
                    Spacer().frame(height: 50)


                    NavigationLink(destination: SignUpView(), tag: 1, selection: $selection) {
                        Button(action: {
                            self.selection = 1
                        }, label: { Text("Sign Up").font(.caption) })
                        
                            .frame(width: 150, height: 30)
                            .foregroundColor(Color(UIColor.mainColor))
                            .background(Color(.white))
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: LoginView(), tag: 2, selection: $selection) {
                        Button(action: {
                            self.selection = 2
                        }, label: { Text("Login").font(.caption) })
                        
                            .frame(width: 150, height: 30)
                            .foregroundColor(Color(UIColor.white)) 
                            .shadow(radius: 5)
                    }
                        


                    Spacer().frame(height: 10)
            }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .center)
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Home"))
                .edgesIgnoringSafeArea(.all)
                .background(Color(UIColor.mainColor))
        }


    }
}
	

struct startView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
