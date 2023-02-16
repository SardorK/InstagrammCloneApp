//
//  Models.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 15/02/23.
//

import UIKit

enum Gender{
    case male, female, other
}

struct User{
    let username: String
    let bio: String
    let name: (first: String,last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType{
    case photo,video
}

//Repesent a user posts
public struct UserPost{
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let tagggedUsers: String
}

struct PostLike{
    let username: String
    let postIdentifier: String
}

struct CommentLike{
    let username: String
    let commentIdentifier: String
}

struct PostComment{
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
