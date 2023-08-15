//
//  StoryBundle.swift
//  Chaos
//
//  Created by Ali on 13.08.2023.
//

import SwiftUI

struct StoryBundle: Identifiable, Hashable {
    var id = UUID().uuidString
    var profileName: String
    var profileImage: String
    var isSeen: Bool = false
    var stories: [Story]
    var likeCount: Int
    var dislikeCount: Int
    var selectingReactionButton: Int?
}

struct Story: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

class StoryViewModel: ObservableObject {
    @Published var stories : [StoryBundle] = [
        
        StoryBundle(profileName: "hello", profileImage: "story1",  stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "world", profileImage: "story2", stories: [
            Story(imageURL: "two"),
            Story(imageURL: "one"),
            Story(imageURL: "four"),
            Story(imageURL: "three"),
            Story(imageURL: "four"),
        ],
                likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story3", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story4", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story5", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story6", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story7", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story8", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil),
        
        StoryBundle(profileName: "hello", profileImage: "story9", stories: [
            Story(imageURL: "one"),
            Story(imageURL: "two"),
            Story(imageURL: "two"),
        ],
                    likeCount: 43, dislikeCount: 21, selectingReactionButton: nil)
    ]
    
    
    @Published var showStory: Bool = false
    
    @Published var currentStory: String = ""
}
