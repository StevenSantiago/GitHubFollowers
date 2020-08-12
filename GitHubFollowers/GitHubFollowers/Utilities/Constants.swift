//
//  Constants.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created and invalid request. Please Try Again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please Try Again."
    case invalidData = "The data received from the server was invalid. Please Try Again."
    case unableToFavorite = "There was an error saving favorites. Please Try Again."
}

enum SFSymbols {
    static let location = "mappin.and.ellipse"
    static let repos = "folder"
    static let gists = "text.alignleft"
    static let followers = "heart"
    static let following = "person.2"
}
