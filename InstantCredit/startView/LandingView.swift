//
//  ContentView.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.


import SwiftUI

struct LandingView: View {

    @State var selection: Int? = nil

    var body: some View {
                VStack(alignment: .center) {
                    
//                    Spacer()
                    HStack {
                        Image("yoga").resizable()
                                .frame(width: 100, height: 50)
                        
                        Text("LifeLink")
                            .foregroundColor(Color(.gray))
                            .font(.largeTitle)
                    }
                        .padding()
//                    Spacer()
                    GeometryReader { geometry in
                        CarouselView()
                    
                    
                        HStack {
                            Spacer(minLength: geometry.size.width/2.5)
                            HStack {
                                Circle().frame(width: 10, height: 10)
                                Circle().frame(width: 10, height: 10)
                                Circle().frame(width: 10, height: 10)
                                Circle().frame(width: 10, height: 10)
                            }
                            Spacer(minLength: geometry.size.width/2.5)
                        }
                            .frame(maxHeight: 20)
                    }
                        
                    VStack(alignment: .leading) {
                        Text("Discover the wonders of the world today!").font(.headline).padding()
                        Text("""
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce condimentum risus dolor, id vehicula nibh.
                            """)
                            .font(.subheadline)
                            .padding()
                    }
//                    Spacer()
                    HStack {
                        NavigationLink(destination: SignUpView(), tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }, label: { Text("Sign Up").font(.body) })
                                .frame(width: 150, height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                                .foregroundColor(Color(UIColor.mainColor))
                                .background(Color(.white))
                                .padding()
                        



                                
                        }
                        NavigationLink(destination: LoginView(), tag: 2, selection: $selection) {
                            Button(action: {
                                self.selection = 2
                            }, label: { Text("Login").font(.caption) })
                                .frame(width: 150, height: 30)
                                .foregroundColor(Color(UIColor.white))
                                .background(Color(UIColor.mainColor))
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    Spacer()
            }
                .navigationBarHidden(true)
                .navigationBarTitle(Text("Home"))
                .edgesIgnoringSafeArea(.horizontal)
//                .background(Color(UIColor.mainColor))
        }
    }


struct CarouselView: View {
    
    var body: some View {
        

        CardView()
    }
}

struct CardView: View {
    var body: some View {
        HStack {
            GeometryReader {geometry in
                ForEach(cardList, id: \.id) { cards in
                    Image(cards.fileName)
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .padding()
                }
            }

        }
        .padding()
            
    }
}

var cardList: Array<Card> {
    [
        Card(fileName: "p1", label: "pikachu"),
        Card(fileName: "p2", label: "bulbasaur"),
        Card(fileName: "p3", label: "charmander"),
        Card(fileName: "p4", label: "squirtle")
    ]
}

struct Card {
    
    var id = UUID()
    var fileName: String
    var label: String
}



















struct startView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
