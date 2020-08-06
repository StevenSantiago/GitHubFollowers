//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/15/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.set(background: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
    
}
