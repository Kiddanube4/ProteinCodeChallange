//
//  HomePageViewModel.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import UIKit
import RealmSwift

protocol HomeViewModelProtocol {
    func didReturnWith(friends: FriendModelObject)
    func didReturnWith(error: String)
    
}
class HomePageViewModel {
    
    var homeVMDelegate: HomeViewModelProtocol?
    var friends = FriendModelObject()
    
    func getFriends(count:Int)  {
        let config = Realm.Configuration(
            schemaVersion: 3, // Increment the schema version to trigger a migration
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Add the primary key to the 'User' class
                    migration.enumerateObjects(ofType: Member.className()) { oldObject, newObject in
                        newObject?["userName"] = "" // Set the default value for the new primary key
                    }
                }
            })
        // Apply the new configuration
        Realm.Configuration.defaultConfiguration = config
        
        BaseWebService.shared.senRequest(to: .getFriends(count: count)) { (response: Result<FriendModelObject, ApiError>) in
            switch response {
            case .success(let friends):
              let realm = try! Realm()
                
               try! realm.write {
                   realm.add(friends)
                   self.homeVMDelegate?.didReturnWith(friends: friends)
                   self.friends = friends
                }
                
                
            case .failure(let failure):
                self.homeVMDelegate?.didReturnWith(error: failure.errorDescription!)
            }
        }
    }
}
