//
//  HomePageViewModel.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import UIKit
import RealmSwift


class HomePageViewModel {
    

    
    func getFriends(count:Int) {
        BaseWebService.shared.senRequest(to: .getFriends(count: count)) { (response: Result<FriendModel, ApiError>) in
            switch response {
            case .success(let success):
               let realm = try! Realm()
                let friendsObject = FriendsObject()
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
