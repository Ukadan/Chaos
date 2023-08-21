//
//  StoryVIew.swift
//  Chaos
//
//  Created by Ali on 14.08.2023.
//

import SwiftUI

struct StoryView: View {
    
    
    @EnvironmentObject var storyData: StoryViewModel
    
    var body: some View {
        
        
        if storyData.showStory {
            TabView(selection: $storyData.currentStory) {
                ForEach($storyData.stories) { $bundle in
                    StoryCardView(bundle: $bundle)
                        .environmentObject(storyData)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .transition(.move(edge: .bottom))
        }
    }
}


struct StoryCardView: View {
    
    @Binding var bundle: StoryBundle
    @EnvironmentObject var storyData: StoryViewModel
    @EnvironmentObject var settings: AppSettings
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var timerProgress: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                let index = min(Int(timerProgress), bundle.stories.count - 1)
                
                if let story = bundle.stories[index] {
                    Image(story.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                HStack {
                    Rectangle()
                        .fill(.black.opacity(0.1))
                        .onTapGesture {
                            if (timerProgress - 1) < 0 {
                                updateStory(forward: false)
                            } else {
                                timerProgress = CGFloat(Int(timerProgress - 1 ))
                            }
                        }
                    Rectangle()
                        .fill(.black.opacity(0.1))
                        .onTapGesture {
                            if (timerProgress + 1) > CGFloat(bundle.stories.count) {
                                updateStory()
                            } else {
                                timerProgress = CGFloat(Int(timerProgress + 1))
                            }
                        }
                }
            )
            .overlay(
                VStack {
                    Spacer()
                    HStack(spacing: 40) {
                        Button(action: {
                                        if bundle.selectingReactionButton == 0 {
                                            bundle.dislikeCount -= 1
                                            bundle.selectingReactionButton = nil
                                        } else {
                                            if bundle.selectingReactionButton == 1 {
                                                bundle.likeCount -= 1
                                                bundle.dislikeCount += 1
                                                bundle.selectingReactionButton = 0
                                            } else {
                                                bundle.dislikeCount += 1
                                                bundle.selectingReactionButton = 0
                                            }
                                        }
                                    }) {
                            ZStack {
                                HStack {
                                    Image(systemName: "hand.thumbsdown.fill")
                                        .foregroundColor(.blue)
                                    
                                    Text("\(bundle.dislikeCount)")
                                        .foregroundColor(settings.darkMode ? (bundle.selectingReactionButton == 0 ? .black : .white) : Color(UIColor.darkGray))
                                }
                            }
                            .frame(width: 80, height: 40)
                            .background(bundle.selectingReactionButton == 0 ? Color.white : Color(UIColor.systemGray2))
                            .cornerRadius(40)
                        }
                        
                        Button(action: {
                                        if bundle.selectingReactionButton == 1 {
                                            bundle.likeCount -= 1
                                            bundle.selectingReactionButton = nil
                                        } else {
                                            if bundle.selectingReactionButton == 0 {
                                                bundle.likeCount += 1
                                                bundle.dislikeCount -= 1
                                                bundle.selectingReactionButton = 1
                                            } else {
                                                bundle.likeCount += 1
                                                bundle.selectingReactionButton = 1
                                            }
                                        }
                                    }) {
                            ZStack {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                        .foregroundColor(.blue)
                                    
                                    Text("\(bundle.likeCount)")
                                        .foregroundColor(settings.darkMode ? (bundle.selectingReactionButton == 1 ? .black : .white) : Color(UIColor.darkGray))
                                }
                                .frame(width: 80, height: 40)
                                .background(bundle.selectingReactionButton == 1 ? Color.white : Color(UIColor.systemGray2))
                                .cornerRadius(40)
                            }
                        }
                    }
                    .padding(.bottom, 64)
                }
            )
            .overlay(
                HStack(spacing: 10) {
                
                   
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                }
                .padding()
                , alignment: .topLeading
            )
            
            .overlay(
                
                HStack(spacing: 5) {
                    ForEach(bundle.stories.indices) { index in
                        GeometryReader { proxy in
                            
                            let width = proxy.size.width
                            let progress = timerProgress - CGFloat(index)
                            let perfectProgress = min(max(progress, 0), 1)
                            
                            Capsule()
                               .fill(.gray.opacity(0.5))
                               .overlay(
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: width * perfectProgress)
                                    , alignment: .leading
                               )
                        }
                    }
                }
                    .frame(height: 2.4)
                    .padding(.horizontal)
                , alignment: .top
            )
            
            .rotation3DEffect(getAngle(proxy: proxy),
                              axis: (x: 0, y: 1, z: 0),
                              anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing)
        }
        .onAppear(perform: {
            timerProgress = 0
        })
        .onReceive(timer) { _ in
            if storyData.currentStory == bundle.id {
                if !bundle.isSeen {
                    bundle.isSeen = true
                }
                
                if timerProgress < CGFloat(bundle.stories.count) {
                    timerProgress += 0.03
                } else {
                    updateStory()
                }
            }
        }
        
        
    }
    
    func updateStory(forward: Bool = true) {
        let index = min(Int(timerProgress), bundle.stories.count - 1)
        let story = bundle.stories[index]
        if !forward {
            if let first = storyData.stories.first, first.id != bundle.id {
                let bundleIndex = storyData.stories.firstIndex { currenBundle in
                    return bundle.id == currenBundle.id
                } ?? 0
                
                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndex - 1].id
                }
            } else {
                timerProgress = 0
            }
        }
        
        if let last = bundle.stories.last, last.id == story.id {
            if let lastBundle = storyData.stories.last, lastBundle.id == bundle.id {
                withAnimation {
                    storyData.showStory = false
                }
                
            } else {
                let bundleIndex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0
                
                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndex + 1].id
                }
            }
        }
    }
    
    func getAngle(proxy: GeometryProxy) -> Angle {
        let progress = proxy.frame(in: .global).minX / proxy.size.width
        
        let rotationAngle: CGFloat = 45
        let degrees = rotationAngle * progress
        
        return Angle(degrees: Double(degrees))
    }
    
}
