//
//  User.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import RealmSwift


class User: Object {
    @Persisted (primaryKey: true) private var userName = ""
    @Persisted private var passWord = ""
    
    convenience init(username: String, password: String) {
          self.init()
          self.userName = username
          self.passWord = password
      }
    
    override static func primaryKey() -> String? {
           return "userName" // Define 'username' as the primary key
       }
    
    func getPassword() -> String {
           return passWord
       }
    
    func getUserName() -> String {
           return userName
       }
}
