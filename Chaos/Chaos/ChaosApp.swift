//
//  ChaosApp.swift
//  Chaos
//
//  Created by Ali on 09.08.2023.
//

import SwiftUI

@main
struct ChaosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
