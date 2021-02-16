//
//  User.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit


class User {
    
    enum Gender: String {
        case Male   = "Мужчина"
        case Female = "Женщина"
    }
    
    let firstName: String
    let lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    let gender: Gender
    var age: UInt8
    
    var avatar: String?
    
    var photos: [String]?
    
    
    init(firstName: String, lastName: String, gender: Gender, age: UInt8) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.age = age
    }
}



//  MARK:   - Get Data
//
func getUserArrayData() -> [User]? {
    
    let data: [(String, String, User.Gender, UInt8, [String])] = [
        ("Иван", "Иванов", .Male, 20, ["001", "002", "003", "004", "005", "006", "007", "008"]),
        ("Петр", "Петров", .Male, 21, ["010", "011", "012", "013"]),
        ("Олег", "Зимин", .Male, 22, ["014", "015"]),
        ("Никита", "Фралов", .Male, 23, ["016", "017", "018"]),
        ("Ольга", "Cадовская", .Female, 24, ["019", "068", "069", "070"]),
        ("Виктор", "Блинов", .Male, 25, ["020", "021", "022", "023", "024", "025"]),
        ("Дмитрий", "Зотов", .Male, 26, ["026", "027"]),
        ("Наташа", "Лебедева", .Female, 27, ["028", "029"]),
        ("Елизавета", "Федорова", .Female, 28, ["030", "031"]),
        ("Юля", "Волк", .Male, 29, ["032", "033", "034"]),
        ("Михаил", "Даченков", .Male, 30, ["035", "036"]),
        ("Владимир", "Суриков", .Male, 31, ["037", "038", "039"]),
        ("Софья", "Павлова", .Female, 32, ["040", "041", "042"]),
        ("Кирилл", "Зайцев", .Male, 33, ["043", "044", "045", "046", "047"]),
        ("Дима", "Роговой", .Male, 34, ["048", "049"]),
        ("Ксения", "Афонасьева", .Female, 35, ["050"]),
        ("Мила", "Рогулина", .Female, 36, ["051", "052"]),
        ("Александр", "Липатов", .Male, 37, ["053", "054", "055"]),
        ("Света", "Дворжикова", .Female, 38, ["056", "057"]),
        ("Павел", "Фокин", .Male, 39, ["061", "062", "063", "064"]),
        ("Елана", "Конышева", .Female, 18, ["058", "059", "060"]),
        ("Артем", "Федоров", .Male, 19, ["065", "066", "067"])
    ]
    
    
    let avatar = ["avatar001", "avatar002", "avatar003", "avatar004", "avatar005", "avatar006", "avatar007", "avatar008", "avatar009", "avatar010", "avatar011", "avatar012", "avatar013", "avatar014", "avatar015", "avatar016", "avatar017", "avatar018", "avatar019", "avatar020", "avatar021", "avatar022"]
    
    
    guard data.count > 0 else {
        return nil
    }
    
    var users = [User]()
    
    for i in 0 ..< data.count {
        let user = User(
            firstName: data[i].0,
            lastName: data[i].1,
            gender: data[i].2,
            age: data[i].3
        )
        
        if i >= avatar.count {
            user.avatar = ""
        } else {
            user.avatar = avatar[i]
        }
        
        user.photos = data[i].4
        
        users.append(user)
    }
    
    return users
}
