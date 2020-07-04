//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/4/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }

}
