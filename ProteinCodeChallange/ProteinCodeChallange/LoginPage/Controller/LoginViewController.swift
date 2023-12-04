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
        
        if userName == "" {
            userNametextField.isErrorLabelHidden = false
            userNametextField.errorLabeltext = "Kullanıcı adı boş olamaz"
            return
        }else {
            userNametextField.isErrorLabelHidden = true
        }
        
        if passWord == "" {
            passWordTextField.isErrorLabelHidden = false
            passWordTextField.errorLabeltext = "Şifre boş olamaz"
            return
        }else {
            passWordTextField.isErrorLabelHidden = true
        }
        
        viewModel.login(userName: userName, passWord: passWord)
    }
    

 
}


extension LoginViewController: LoginViewModelDelegate {
    func login(didFailWithError: String) {
        let actionSheet = UIAlertController(title: "Hata !", message: didFailWithError, preferredStyle: .actionSheet)
        present(actionSheet, animated: true) {
         let timer =  Timer(timeInterval: 0.8, repeats: false) { _ in
                self.dismiss(animated: true)
            }
            timer.fire()
        }
        
    }
    
    func login() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homePageviewController = storyBoard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        navigationController?.pushViewController(homePageviewController, animated: true)
    }
    
    
    
}
