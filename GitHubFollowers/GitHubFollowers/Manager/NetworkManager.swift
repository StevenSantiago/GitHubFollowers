//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

class NetworkManager {
    static let instance = NetworkManager()
    let baseURL = "https://api.github.com"
    let resultPerPage = 100
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=\(resultPerPage)&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created and invalid request. Please Try Again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please Try Again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please Try Again.")
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data from server was not parsed or received as expected.")
            }
            
        }
        
        task.resume()
    }
}
