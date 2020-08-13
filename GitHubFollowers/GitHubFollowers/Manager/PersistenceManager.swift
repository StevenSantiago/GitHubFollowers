//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 8/11/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                var retrieveFavorites = favorites
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        completed(.alreadyFavorited)
                        return
                    }
                    retrieveFavorites.append(favorite)
                case .remove:
                    retrieveFavorites.removeAll {$0.login == favorite.login}
                }
                
                completed(saveFavorites(retrieveFavorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    //Saving to UserDefault, simple enough. Core Data is not needed for now
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do{
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func saveFavorites(_ favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let favorites = try encoder.encode(favorites)
            defaults.setValue(favorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
