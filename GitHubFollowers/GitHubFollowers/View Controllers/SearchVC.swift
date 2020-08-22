//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 3/7/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let getFollowersButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered : Bool {
        return !userNameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        userNameTextField.delegate = self
        
        configureLogoImageView()
        configureTextField()
        configureGetFollowersButton()
        createDismissKeyBoardTapGesture()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        userNameTextField.resignFirstResponder()
    }
    
    @objc func pushFollowerListVC() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😅.", buttonTitle: "Ok")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.userName = userNameTextField.text
        followerListVC.title = userNameTextField.text
        
        navigationController?.pushViewController(followerListVC, animated:true)
        
    }
    
    func createDismissKeyBoardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Check if the keyboard covers the bottom of textfield
            let cover = userNameTextField.frame.origin.y + userNameTextField.frame.height - keyboardSize.minY // can also use keyboardSize.origin.y
            
            if cover > 0 {
                self.view.frame.origin.y -= cover
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    //MARK: Configuring AutoLayout
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(userNameTextField)

        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureGetFollowersButton() {
        view.addSubview(getFollowersButton)
        getFollowersButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //TODO: Pass the data
        pushFollowerListVC()
        return true
    }
}
