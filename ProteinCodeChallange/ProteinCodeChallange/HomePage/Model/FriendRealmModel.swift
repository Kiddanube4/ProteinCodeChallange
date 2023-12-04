//
//  FriendRealmModel.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 5.12.2023.
//

import Foundation
import RealmSwift

// MARK: - Welcome
class FriendsObject: Object {
    @objc dynamic var info: InfoObject?
    let results = List<ResultObject>()
}

// MARK: - Info
class InfoObject: Object {
    @objc dynamic var seed: String = ""
    @objc dynamic var results: Int = 0
    @objc dynamic var page: Int = 0
    @objc dynamic var version: String = ""
}

// MARK: - Result
class ResultObject: Object {
    @objc dynamic var gender: String = ""
    @objc dynamic var name: NameObject?
    @objc dynamic var location: LocationObject?
    @objc dynamic var email: String = ""
    @objc dynamic var login: LoginObject?
    @objc dynamic var dob: DobObject?
    @objc dynamic var registered: DobObject?
    @objc dynamic var phone: String = ""
    @objc dynamic var cell: String = ""
    @objc dynamic var id: IDObject?
    @objc dynamic var picture: PictureObject?
    @objc dynamic var nat: String = ""
}

// MARK: - Dob
class DobObject: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var age: Int = 0
}

// MARK: - ID
class IDObject: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var value: String?
}

// MARK: - Location
class LocationObject: Object {
    @objc dynamic var street: StreetObject?
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var postcode: String = ""
    @objc dynamic var coordinates: CoordinatesObject?
    @objc dynamic var timezone: TimezoneObject?
}

// MARK: - Coordinates
class CoordinatesObject: Object {
    @objc dynamic var latitude: String = ""
    @objc dynamic var longitude: String = ""
}

// MARK: - Street
class StreetObject: Object {
    @objc dynamic var number: Int = 0
    @objc dynamic var name: String = ""
}

// MARK: - Timezone
class TimezoneObject: Object {
    @objc dynamic var offset: String = ""
    @objc dynamic var descriptionText: String = ""
}

// MARK: - Login
class LoginObject: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var salt: String = ""
    @objc dynamic var md5: String = ""
    @objc dynamic var sha1: String = ""
    @objc dynamic var sha256: String = ""
}

// MARK: - Name
class NameObject: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var first: String = ""
    @objc dynamic var last: String = ""
}

// MARK: - Picture
class PictureObject: Object {
    @objc dynamic var large: String = ""
    @objc dynamic var medium: String = ""
    @objc dynamic var thumbnail: String = ""
}
