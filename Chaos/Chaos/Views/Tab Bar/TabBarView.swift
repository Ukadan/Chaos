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
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Kolesa.kz", systemImage: "house.fill")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            BasketView()
                .tabItem {
                    Label("Submit", systemImage: "cart.fill")
                }
            MessageView()
                .tabItem {
                    Label("Messages", systemImage: "envelope.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                    
                }
        }
        .accentColor(.black)
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

// HomeView
struct HomeView: View {
    @State private var isPageOnePresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: pageOne()) {
                    Text("Open")
                }
            }
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
struct BasketView: View {
    var body: some View {
        ZStack {
            Color.white
            Text("Basket Screen")
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

// ProfileView
struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Profile Screen")
                .foregroundColor(.white)
        }
    }
}
