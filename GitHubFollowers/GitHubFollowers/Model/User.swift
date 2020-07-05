//
//  User.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
