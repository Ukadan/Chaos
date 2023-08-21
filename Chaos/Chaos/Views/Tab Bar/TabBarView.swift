//
//  TabBarView.swift
//  Chaos
//
//  Created by Ali on 11.08.2023.
//

import SwiftUI
import UIKit
import CoreData

struct TabBarView: View {
 

    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var settings: AppSettings
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        
        animation: .linear)
    
    private var items: FetchedResults<Item>
    
    @StateObject var storyData = StoryViewModel()
    
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool = false
    @State private var scrolling: Bool = false
    
    var body: some View {
        var handlear: Binding<Int> { Binding (
            get: { self.tabSelection },
            set: {
                if $0 == self.tabSelection {
                    tappedTwice = true
                }
                self.tabSelection = $0
            }
        )}
        return ScrollViewReader { proxy in
            ZStack(alignment: .bottom) {
                TabView(selection: handlear) {
                    HomeView()
                        .onChange(of: tappedTwice, perform: { tapped in
                            if tapped {
                                withAnimation {
                                    proxy.scrollTo(1)
                                }
                                tappedTwice = false
                            }
                        })
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Kolesa.kz")
                        }
                        .tag(1)
                    
                    NavigationView {
                        FavoriteView()
                    }
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                    .tag(2)
                    
                    
                    
                    SubmitView()
                        .tabItem {
                            Label("Submit", systemImage: "plus.square.fill")
                                .background(.red)
                        }
                        .tag(3)
                    
                    MessageView()
                        .tabItem {
                            Label("Messages", systemImage: "envelope.fill")
                        }
                        .tag(4)
                    
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle.fill")
                        }
                        .tag(5)
                }
                .accentColor(settings.darkMode ? .white : .black)
                
            }
        }
    }
}

struct pageOne: View {
    var body: some View {
        ZStack {
            Color.red
            Text("Moldir zhopa!!")
                .foregroundColor(.white)
        
        }
    }
}

//Favorite
struct FavoriteView: View {
    var body: some View {
        ZStack {
            Color.green
            Text("Favorite Screen")
                .foregroundColor(.green)
        
        }
    }
}

// BasketView
struct SubmitView: View {
    
    func stateApp() -> Bool {
        
        if UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle == .dark {
            return true
        }
        
        else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
//            Color.white
//            Text("SubmitView Screen")
//                .foregroundColor(.black)
            if stateApp() == true {
                Color.red
            } else {
                Color.yellow
            }
        }
    }
}

// Message
struct MessageView: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("Message Screen")
                .foregroundColor(.white)
        }
    }
}



struct TabBarView_Previews: PreviewProvider {    
    static var previews: some View {
        TabBarView()
    }
}
