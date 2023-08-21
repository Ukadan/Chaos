//
//  ContentView.swift
//  Chaos
//
//  Created by Ali on 09.08.2023.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
    @StateObject var appSettings = AppSettings()
    
    var body: some View {
        TabBarView()
            .environmentObject(appSettings)
    }
}


//extension UITabBarController {
//    override open func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        
//        appearance.backgroundColor = .white
//        appearance.shadowImage = UIImage()
//        appearance.shadowColor = .red
//        
//        appearance.stackedLayoutAppearance.normal.iconColor = .black
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//        
//        self.tabBar.standardAppearance = appearance
//    }
//}
