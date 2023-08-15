//
//  SettingView.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import SwiftUI
import Foundation
import UIKit

struct SettingView: View {
    @State public var toggleOn =  true
        
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Language")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color(toggleOn ? UIColor.darkText : .white))
                        
                        Spacer()
                        
                        Text("English")
                            .foregroundColor(Color(toggleOn ? UIColor.secondaryLabel : .white))
                            .font(.system(size: 16, weight: .light))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(toggleOn ? UIColor.systemGray : .white))
                        
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                    
                    Rectangle()
                        .foregroundColor(Color(toggleOn ? UIColor.separator : .white))
                        .frame(height: 1)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    HStack {
                        Text("About the app")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color(toggleOn ? UIColor.darkText : .white))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(toggleOn ? UIColor.systemGray : .white))
                        
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                }
                
                Spacer()
            }
            .background(Color(toggleOn ? .white : .black))

        }
        .background(NavigationConfigurator { nc in
            nc.navigationBar.barTintColor = .blue
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        })
        .navigationBarTitle("Profile settings", displayMode: .inline)

        .navigationBarItems(trailing: ZStack {
                    VStack (){
                        ZStack {
                            Capsule()
                                .frame(width:66,height:36)
                                .foregroundColor(Color(toggleOn ? UIColor.systemGray2 : UIColor.systemGray2))
        
                            ZStack{
                                Circle()
                                    .frame(width:34, height:34)
                                    .foregroundColor(Color(toggleOn ? .black : .white))
                                Image(systemName: toggleOn ? "sun.max.fill" : "moon.fill")
                                    .foregroundColor(Color(toggleOn ? .yellow : .black))
                            }
                            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                            .offset(x:toggleOn ? 18 : -18)
                            .padding(24)
                            .animation(.spring())
                        }
                        .onTapGesture {
                            self.toggleOn.toggle()
                        }
                    }
                }
                .ignoresSafeArea(.all)
                .animation(.default))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
