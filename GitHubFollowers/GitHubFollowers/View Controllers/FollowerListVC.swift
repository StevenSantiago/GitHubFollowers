//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 3/7/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.instance.getFollowers(for: userName, page: 1) { result in
            
            switch result {
                
            case .success(let followers):
                print("\(followers.count)")
                print(followers)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
