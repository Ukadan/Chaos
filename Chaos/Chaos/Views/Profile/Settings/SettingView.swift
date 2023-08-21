//
//  SettingView.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import SwiftUI
import Foundation
import UIKit

class AppSettings: ObservableObject {
    @Published var darkMode = false
}

struct SettingView: View {
    @EnvironmentObject var settings: AppSettings
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Text("Language")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.darkText))
                        
                        Spacer()
                        
                        Text("English")
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.secondaryLabel))
                            .font(.system(size: 16, weight: .light))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.systemGray))
                        
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                    
                    Rectangle()
                        .foregroundColor(Color(settings.darkMode ? .white :  UIColor.separator))
                        .frame(height: 1)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    HStack {
                        Text("About the app")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.darkText))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.systemGray))
                        
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                    Rectangle()
                        .foregroundColor(Color(settings.darkMode ? .white :  UIColor.separator))
                        .frame(height: 1)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    HStack {
                        Text("Selected App")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.darkText))
                        
                        Spacer()
                        
                        Text("Kolesa.kz")
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.secondaryLabel))
                            .font(.system(size: 16, weight: .light))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(settings.darkMode ? .white : UIColor.systemGray))
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("Profile settings", displayMode: .inline)
        .navigationBarItems(trailing: ZStack {
            VStack (){
                ZStack {
                    
                    Capsule()
                        .frame(width:66,height:36)
                        .foregroundColor(Color(settings.darkMode ? UIColor.systemGray2 : UIColor.systemGray2))
                    
                    ZStack{
                        Circle()
                            .frame(width:34, height:34)
                            .foregroundColor(Color(settings.darkMode ? UIColor.systemBlue : .black))
                            
                        Image(systemName: settings.darkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(Color(settings.darkMode ? .yellow : .white))
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x:settings.darkMode ? 18 : -18)
                    .padding(24)
                    .animation(.spring())
                }
                .onTapGesture {
                    settings.darkMode.toggle()
                
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.settings.darkMode ? .dark : .light
                }
            }
        }
            .ignoresSafeArea(.all)
            .animation(.default)
        
        )
        
        
        .environmentObject(settings)
    }
}



//
//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
//
//struct NavigationConfigurator: UIViewControllerRepresentable {
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//        UIViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//        if let nc = uiViewController.navigationController {
//            self.configure(nc)
//        }
//    }
//}
