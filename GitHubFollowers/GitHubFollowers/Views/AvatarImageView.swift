//
//  AvatarImageView.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        NetworkManager.instance.downloadImage(for: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.image = image
                }
            default:
                return
            }
        }
    }
    
}
