//
//  LoginViewController.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNametextField: LoginTF!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var loginElementContainerView: UIView!
    @IBOutlet weak var passWordTextField: LoginTF!
    
    var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupView(loginButton: btnLogin,
                            userNameTF: userNametextField,
                            passWordTF: passWordTextField,
                            containerView: loginElementContainerView)
        viewModel.loginDelegate = self

    }
    

    @IBAction func loginAction(_ sender: UIButton) {
        guard let userName = userNametextField.text,
              let passWord = passWordTextField.text else {return}
        
        viewModel.login(userName: userName, passWord: passWord)
    }
    

 
}


extension LoginViewController: LoginViewModelDelegate {
    func login(didFailWithError: String) {
        print(didFailWithError)
    }
    
    func login() {
        print("success")
    }
    
    
    
}
