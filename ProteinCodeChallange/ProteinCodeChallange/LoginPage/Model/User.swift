//
//  User.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
import RealmSwift


class User: Object {
    @Persisted private var userName = ""
    @Persisted private var passWord = ""
    
    convenience init(username: String, password: String) {
          self.init()
          self.userName = username
          self.passWord = password
      }
}
