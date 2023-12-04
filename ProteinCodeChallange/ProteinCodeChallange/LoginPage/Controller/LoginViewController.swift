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

        // Do any additional setup after loading the view.
    }
    

    

 
}
