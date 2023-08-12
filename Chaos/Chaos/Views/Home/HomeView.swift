//
//  HomeView.swift
//  Chaos
//
//  Created by Ali on 11.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        // Reset the appearance of the navigation bar to its default settings
        UINavigationBar.appearance().standardAppearance = UINavigationBarAppearance()
    }
    
    var body: some View {
            VStack {
                ScrollView(.vertical){
                    VStack {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 5) {
                                ForEach(1...10, id: \.self) { index in
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.black)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(
                                                    LinearGradient(
                                                        colors: [.red,.blue],
                                                        startPoint: .top,
                                                        endPoint: .bottom)
                                                    , lineWidth: 8)
                                        )
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .background(.white)
                    .id(1)
                    
                    
                    VStack(spacing: 1) {
                        HStack(spacing: 0) {
                            Button(action: {}) {
                                Image(systemName: "car.side")
                                Text("Cars")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "bus.fill")
                                    
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "cart")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "car.window.left")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                        }
                        
                        HStack(spacing: 1) {
                            Button(action: {}) {
                                Image(systemName: "bus.fill")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "car.side")
                                    
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "car.side")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                            
                            Button(action: {}) {
                                Image(systemName: "car.side")
                            }
                            .frame(width: 104, height: 104, alignment: .center)
                        }
                    }
                    .background(.white)
                    .cornerRadius(15)
                    
                    VStack {
                        ForEach(1...20, id: \.self) { index in
                            CardView()
                        }
                    }
                }
            }
            .navigationBarItems(leading: Image("logoKolesa")
                                    .resizable()
                                    .frame(width: 150, height: 50),
                                trailing: NavigationLink(destination: Text("News")) {
                                    Text("News")
                                        .foregroundColor(.blue)
                                })
            .toolbarBackground(Color.white)
            .background(Color(UIColor.systemGray5))
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
