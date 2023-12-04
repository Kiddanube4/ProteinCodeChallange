//
//  LoginViewModel.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import UIKit
import RealmSwift

protocol LoginViewModelDelegate {
    func login(didFailWithError: String)
    func login()
}

class LoginViewModel {
    private let userNames = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
    private let passwords = ["A2bcd", "X9hjk", "R4LMn", "P0qrs", "F8tuv"]
    let realm: Realm?
    var loginDelegate: LoginViewModelDelegate?
    init() {
        realm = try! Realm()
        for (index, usernama) in userNames.enumerated() {
            let passWord = passwords[index]
            let newUser = User(username: usernama, password: passWord)
            
            try! realm?.write({
                realm?.add(newUser)
            })
        }
     
    }
    
    func setupView(loginButton: UIButton,
                   userNameTF :LoginTF,
                   passWordTF: LoginTF,
                   containerView: UIView) {
        
        loginButton.layer.cornerRadius = 15
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.layer.cornerRadius = 15
        
        userNameTF.isErrorLabelHidden = true
        passWordTF.isErrorLabelHidden = true
        passWordTF.isSecureTextEntry = true
        
        userNameTF.topLabelText = "Kullanıcı Adı: "
        passWordTF.topLabelText = "Şifre: "
        
    }
    
    
    func login(userName: String, passWord:String) {
        let userCheckQuery = realm?.objects(User.self).filter("userName == %@ AND passWord == %@", userName, passWord)

        // Access the first user with the specified username (if it exists)
        if let user = userCheckQuery?.first {
            // Access user properties
            loginDelegate?.login()
        } else {
            loginDelegate?.login(didFailWithError: "Kullanıcı adı veya şifre hatalı")
        }
        
    
    }
    
    
}
