//
//  TabBarView.swift
//  Chaos
//
//  Created by Ali on 11.08.2023.
//

import SwiftUI
import CoreData

struct TabBarView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
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
                    }
                    .tag(3)
                
                MessageView()
                    .tabItem {
                        Label("Messages", systemImage: "envelope.fill")
                    }
                    .tag(4)
                
                NavigationView {
                    ProfileView()
                }
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                        
                    }
                    .tag(5)
            }
            .onAppear {
                        let appearance = UITabBarAppearance()
                        appearance.configureWithOpaqueBackground()
                        appearance.backgroundColor = .white // Set the tab bar background color
                        UITabBar.appearance().standardAppearance = appearance
                    }
            .accentColor(.black)
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
    var body: some View {
        ZStack {
            Color.white
            Text("SubmitView Screen")
                .foregroundColor(.black)
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
