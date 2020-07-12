//
//  GFSecondaryTitleLabel.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/12/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       init(fonttSize: CGFloat) {
           super.init(frame: .zero)
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: fonttSize, weight: .medium)
           configure()
       }
       
       private func configure() {
           textColor = .label
           adjustsFontSizeToFitWidth = true
           minimumScaleFactor = 0.90
           lineBreakMode = .byTruncatingTail
           translatesAutoresizingMaskIntoConstraints = false
       }

}
