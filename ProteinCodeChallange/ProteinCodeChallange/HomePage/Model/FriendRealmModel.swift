import RealmSwift

// MARK: - FriendModel
class FriendModelObject: Object, Codable {
    @Persisted var results = List<ResultObject>()
    @Persisted var info: InfoObject?
    
    enum CodingKeys: String, CodingKey {
        case results, info
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let decodedResults = try container.decodeIfPresent(List<ResultObject>.self, forKey: .results) {
            self.results.append(objectsIn: decodedResults)
        }
        self.info = try container.decodeIfPresent(InfoObject.self, forKey: .info)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(results), forKey: .results)
        try container.encode(info, forKey: .info)
    }
}

// MARK: - Info
class InfoObject: EmbeddedObject, Codable {
    @Persisted var seed: String = ""
    @Persisted var results: Int = 0
    @Persisted var page: Int = 0
    @Persisted var version: String = ""
    
    enum CodingKeys: String, CodingKey {
        case seed, results, page, version
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seed = try container.decode(String.self, forKey: .seed)
        self.results = try container.decode(Int.self, forKey: .results)
        self.page = try container.decode(Int.self, forKey: .page)
        self.version = try container.decode(String.self, forKey: .version)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(seed, forKey: .seed)
        try container.encode(results, forKey: .results)
        try container.encode(page, forKey: .page)
        try container.encode(version, forKey: .version)
    }
}

// MARK: - Result
class ResultObject: Object, Codable {
    @Persisted var gender: String = ""
    @Persisted var name: NameObject?
    @Persisted var location: LocationObject?
    @Persisted var email: String = ""
    @Persisted var login: LoginObject?
    @Persisted var dob: DobObject?
    @Persisted var registered: DobObject?
    @Persisted var phone: String = ""
    @Persisted var cell: String = ""
    @Persisted var id: IDObject?
    @Persisted var picture: PictureObject?
    @Persisted var nat: String = ""
    
    enum CodingKeys: String, CodingKey {
           case gender, name, location, email, login, dob, registered, phone, cell, id, picture, nat
       }

       required convenience init(from decoder: Decoder) throws {
           self.init()
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.gender = try container.decode(String.self, forKey: .gender)
           self.name = try container.decode(NameObject.self, forKey: .name)
           self.location = try container.decode(LocationObject.self, forKey: .location)
           self.email = try container.decode(String.self, forKey: .email)
           self.login = try container.decode(LoginObject.self, forKey: .login)
           self.dob = try container.decode(DobObject.self, forKey: .dob)
           self.registered = try container.decode(DobObject.self, forKey: .registered)
           self.phone = try container.decode(String.self, forKey: .phone)
           self.cell = try container.decode(String.self, forKey: .cell)
           self.id = try container.decode(IDObject.self, forKey: .id)
           self.picture = try container.decode(PictureObject.self, forKey: .picture)
           self.nat = try container.decode(String.self, forKey: .nat)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encodeIfPresent(gender, forKey: .gender)
           try container.encode(name, forKey: .name)
           try container.encode(location, forKey: .location)
           try container.encode(email, forKey: .email)
           try container.encode(login, forKey: .login)
           try container.encode(dob, forKey: .dob)
           try container.encode(registered, forKey: .registered)
           try container.encode(phone, forKey: .phone)
           try container.encode(cell, forKey: .cell)
           try container.encode(id, forKey: .id)
           try container.encode(picture, forKey: .picture)
           try container.encode(nat, forKey: .nat)
       }
}

// MARK: - Dob
class DobObject: EmbeddedObject, Codable {
    @Persisted var date: String = ""
    @Persisted var age: Int = 0
    enum CodingKeys: String, CodingKey {
           case date, age
       }
       
       required convenience init(from decoder: Decoder) throws {
           self.init()
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.date = try container.decode(String.self, forKey: .date)
           self.age = try container.decode(Int.self, forKey: .age)
       }
       
       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(date, forKey: .date)
           try container.encode(age, forKey: .age)
       }
}

// MARK: - ID
class IDObject: EmbeddedObject, Codable {
    @Persisted var name: String = ""
    @Persisted var value: String?
    enum CodingKeys: String, CodingKey {
           case name, value
       }

       required convenience init(from decoder: Decoder) throws {
           self.init()
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.name = try container.decode(String.self, forKey: .name)
           self.value = try container.decodeIfPresent(String.self, forKey: .value)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(name, forKey: .name)
           try container.encodeIfPresent(value, forKey: .value)
       }
}

// MARK: - Location
class LocationObject: EmbeddedObject, Codable {
    @Persisted var street: StreetObject?
    @Persisted var city: String = ""
    @Persisted var state: String = ""
    @Persisted var country: String = ""
    @Persisted var coordinates: CoordinatesObject?
    @Persisted var timezone: TimezoneObject?
    
    enum CodingKeys: String, CodingKey {
          case street, city, state, country, coordinates, timezone
      }

      required convenience init(from decoder: Decoder) throws {
          self.init()
          let container = try decoder.container(keyedBy: CodingKeys.self)
          self.street = try container.decode(StreetObject.self, forKey: .street)
          self.city = try container.decode(String.self, forKey: .city)
          self.state = try container.decode(String.self, forKey: .state)
          self.country = try container.decode(String.self, forKey: .country)
          self.coordinates = try container.decode(CoordinatesObject.self, forKey: .coordinates)
          self.timezone = try container.decode(TimezoneObject.self, forKey: .timezone)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(street, forKey: .street)
          try container.encode(city, forKey: .city)
          try container.encode(state, forKey: .state)
          try container.encode(country, forKey: .country)
          
          try container.encode(coordinates, forKey: .coordinates)
          try container.encode(timezone, forKey: .timezone)
      }
}

// MARK: - Coordinates
class CoordinatesObject: EmbeddedObject, Codable {
    @Persisted var latitude: String = ""
    @Persisted var longitude: String = ""
    enum CodingKeys: String, CodingKey {
          case latitude, longitude
      }

      required convenience init(from decoder: Decoder) throws {
          self.init()
          let container = try decoder.container(keyedBy: CodingKeys.self)
          self.latitude = try container.decode(String.self, forKey: .latitude)
          self.longitude = try container.decode(String.self, forKey: .longitude)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(latitude, forKey: .latitude)
          try container.encode(longitude, forKey: .longitude)
      }
}

// MARK: - Street
class StreetObject: EmbeddedObject, Codable {
    @Persisted var number: Int = 0
    @Persisted var name: String = ""
    
    enum CodingKeys: String, CodingKey {
           case number, name
       }

       required convenience init(from decoder: Decoder) throws {
           self.init()
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.number = try container.decode(Int.self, forKey: .number)
           self.name = try container.decode(String.self, forKey: .name)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(number, forKey: .number)
           try container.encode(name, forKey: .name)
       }
}

// MARK: - Timezone
class TimezoneObject: EmbeddedObject, Codable {
    @Persisted var offset: String = ""
    @Persisted var descriptionText: String = ""
    enum CodingKeys:String, CodingKey {
        case offset
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try container.decode(String.self, forKey: .offset)
       
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(offset, forKey: .offset)
    }
}

// MARK: - Login
class LoginObject: EmbeddedObject, Codable {
    @Persisted var uuid: String = ""
    @Persisted var username: String = ""
    @Persisted var password: String = ""
    @Persisted var salt: String = ""
    @Persisted var md5: String = ""
    @Persisted var sha1: String = ""
    @Persisted var sha256: String = ""
    
    enum CodingKeys: String, CodingKey {
          case uuid, username, password, salt, md5, sha1, sha256
      }

      required convenience init(from decoder: Decoder) throws {
          self.init()
          let container = try decoder.container(keyedBy: CodingKeys.self)
          self.uuid = try container.decode(String.self, forKey: .uuid)
          self.username = try container.decode(String.self, forKey: .username)
          self.password = try container.decode(String.self, forKey: .password)
          self.salt = try container.decode(String.self, forKey: .salt)
          self.md5 = try container.decode(String.self, forKey: .md5)
          self.sha1 = try container.decode(String.self, forKey: .sha1)
          self.sha256 = try container.decode(String.self, forKey: .sha256)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(uuid, forKey: .uuid)
          try container.encode(username, forKey: .username)
          try container.encode(password, forKey: .password)
          try container.encode(salt, forKey: .salt)
          try container.encode(md5, forKey: .md5)
          try container.encode(sha1, forKey: .sha1)
          try container.encode(sha256, forKey: .sha256)
      }
}

// MARK: - Name
class NameObject: EmbeddedObject, Codable {
    @Persisted var title: String = ""
    @Persisted var first: String = ""
    @Persisted var last: String = ""
    
    enum CodingKeys: String, CodingKey {
          case title, first, last
      }

      required convenience init(from decoder: Decoder) throws {
          self.init()
          let container = try decoder.container(keyedBy: CodingKeys.self)
          self.title = try container.decode(String.self, forKey: .title)
          self.first = try container.decode(String.self, forKey: .first)
          self.last = try container.decode(String.self, forKey: .last)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(title, forKey: .title)
          try container.encode(first, forKey: .first)
          try container.encode(last, forKey: .last)
      }
}

// MARK: - Picture
class PictureObject: EmbeddedObject, Codable {
    @Persisted var large: String = ""
    @Persisted var medium: String = ""
    @Persisted var thumbnail: String = ""
    enum CodingKeys: String, CodingKey {
           case large, medium, thumbnail
       }

       required convenience init(from decoder: Decoder) throws {
           self.init()
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.large = try container.decode(String.self, forKey: .large)
           self.medium = try container.decode(String.self, forKey: .medium)
           self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
       }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(large, forKey: .large)
           try container.encode(medium, forKey: .medium)
           try container.encode(thumbnail, forKey: .thumbnail)
       }
}
