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
    
    let data: [(String, String, User.Gender, UInt8)] = [
        ("Иван", "Иванов", .Male, 20),
        ("Петр", "Петров", .Male, 21),
        ("Олег", "Зимин", .Male, 22),
        ("Никита", "Фралов", .Male, 23),
        ("Ольга", "Cадовская", .Female, 24),
        ("Виктор", "Блинов", .Male, 25),
        ("Дмитрий", "Зотов", .Male, 26),
        ("Наташа", "Лебедева", .Female, 27),
        ("Елизавета", "Федорова", .Female, 28),
        ("Юля", "Волк", .Male, 29),
        ("Михаил", "Даченков", .Male, 30),
        ("Владимир", "Суриков", .Male, 31),
        ("Софья", "Павлова", .Female, 32),
        ("Кирилл", "Зайцев", .Male, 33),
        ("Дима", "Роговой", .Male, 34),
        ("Ксения", "Афонасьева", .Female, 35),
        ("Мила", "Рогулина", .Female, 36),
        ("Александр", "Липатов", .Male, 37),
        ("Света", "Дворжикова", .Female, 38),
        ("Павел", "Фокин", .Male, 39),
        ("Елана", "Конышева", .Female, 18),
        ("Артем", "Федоров", .Male, 19)
    ]
    
    
    let avatar = ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022"]
    
    
    
    
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
        
        users.append(user)
    }
    
    return users
}
