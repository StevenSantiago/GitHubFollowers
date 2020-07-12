//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/9/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.instance.getUserInfo(for: userName) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let user):
                print("User info: \(user)")
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }


}
