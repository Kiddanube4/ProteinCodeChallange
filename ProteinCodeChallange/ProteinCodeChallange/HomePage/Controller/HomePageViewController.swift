//
//  HomePageViewController.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import UIKit

class HomePageViewController: UIViewController {
    
   let homePageVM = HomePageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ana sayfa"
        homePageVM.getFriends(count: 20)
        // Do any additional setup after loading the view.
    }
    

 
}
