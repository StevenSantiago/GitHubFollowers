//
//  GFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/18/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, count: user.followers)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.following)
        actionButton.set(background: .systemGreen, title: "Get Followers")
    }
    
}
