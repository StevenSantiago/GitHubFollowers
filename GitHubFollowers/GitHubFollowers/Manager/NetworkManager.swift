//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class NetworkManager {
    static let instance = NetworkManager()
    private let baseURL = "https://api.github.com"
    private let resultPerPage = 100
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=\(resultPerPage)&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
    func downloadImage(for url: String, completed: @escaping (Result<UIImage, GFError>) -> Void) {
        
        let cacheKey = NSString(string: url)
        if let image = cache.object(forKey: cacheKey) {
            completed(.success(image))
            return
        }
        
        guard let url = URL(string: url) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
        
            
            guard let image = UIImage(data: data) else {
                completed(.failure(.invalidData))
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(.success(image))
            return
        }
        
        task.resume()
    }
}
