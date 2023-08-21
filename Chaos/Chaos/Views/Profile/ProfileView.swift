//
//  ProfileView.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var phoneNumber: String = ""
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center, spacing: 1) {
                    Image(settings.darkMode ? "logoKolesaWhite" : "logoKolesa")
                        .resizable()
                        .frame(width: 150, height: 30)
                    
                    TextField("Enter a phone Number", text: $phoneNumber)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(UIColor.separator), lineWidth: 1))
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                    
                    Button(action: {}) {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .cornerRadius(6)
                                .foregroundColor(Color(UIColor.systemGray5))
                            
                            Text("Continue")
                                .foregroundColor(Color(UIColor.gray))
                                .bold()
                        }
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                    }
                    
                }
                Spacer()
            }
            .navigationBarItems(leading: Text("My profile")
                .font(.system(size: 20, weight: .medium)),
                                trailing: NavigationLink(destination: SettingView()) {
                Image(systemName: "gearshape")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25)
            })
        }
            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
