//
//  LoginViewModel.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import UIKit

class LoginViewModel {
    
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
        
        userNameTF.topLabelText = "Kullanıcı Adı: "
        passWordTF.topLabelText = "Şifre: "
        
    }
    
    
}
