//
//  StoryDesignView.swift
//  Chaos
//
//  Created by Ali on 14.08.2023.
//

import SwiftUI

struct StoryDesignView: View {
    
    @Binding var bundle : StoryBundle
    @Environment(\.colorScheme) var scheme
    @EnvironmentObject var storyDate: StoryViewModel
    @EnvironmentObject var setttng: AppSettings
    
var body: some View {
    Image(bundle.profileImage)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 100)
        .clipShape(Rectangle())
        .cornerRadius(6)
        .background( scheme == .dark ? .black : .white, in: Rectangle())
        .overlay(
            Rectangle()
                .cornerRadius(6)
                .foregroundColor(.black)
                .frame(width: 97, height: 97)
                .opacity(setttng.darkMode ? 0.2 : 0.0)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.white, lineWidth: 4)
                .frame(width: 98, height: 98)
                .opacity(bundle.isSeen ? 0 : 1)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(
                    LinearGradient(
                        colors: [setttng.darkMode ? .green : .red,.blue],
                        startPoint: .top,
                        endPoint: .bottom),
                        lineWidth: 4)
                .opacity(bundle.isSeen ? 0 : 1)
        )
        .opacity(bundle.isSeen ? 0.6 : 1)
        .padding(EdgeInsets(top: 5, leading: 1, bottom: 5, trailing: 1))
        .onTapGesture {
            withAnimation {
                bundle.isSeen = true
                storyDate.currentStory = bundle.id
                storyDate.showStory = true
            }
        }
    }
}
