//
//  HomePageViewController.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ana sayfa"
        
        let backButton = UIBarButtonItem()
        backButton.title = "Çıkış"
        navigationItem.backBarButtonItem = backButton
        // Do any additional setup after loading the view.
    }
    

 
}
