//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    // Optimization
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
