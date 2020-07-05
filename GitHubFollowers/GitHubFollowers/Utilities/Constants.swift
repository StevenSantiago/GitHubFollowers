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
}
