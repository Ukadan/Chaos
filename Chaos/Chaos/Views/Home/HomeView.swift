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
        NavigationView {
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
                    
                    VStack(spacing: 1) {
                        HStack(spacing: 1) {
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                        }
                        
                        HStack(spacing: 1) {
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                            Rectangle()
                                .frame(width: 104, height: 104)
                        }
                    }
                    
                    VStack {
                        ForEach(1...4, id: \.self) { index in
                            Rectangle()
                                .frame(height: 300)
                                .foregroundColor(.black)
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
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
