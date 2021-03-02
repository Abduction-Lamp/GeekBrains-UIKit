//
//  User.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import UIKit


struct User {
    
    enum Gender: String {
        case Male   = "Мужчина"
        case Female = "Женщина"
    }
    
    
    // MARK: - Properties
    //
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    
    let gender: Gender
    
    var age: UInt8
    
    var avatar: String?
    var photos: [String]?
    
    
    // MARK: - Init
    //
    init(firstName: String, lastName: String, gender: Gender, age: UInt8) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.age = age
    }
    
    
    // MARK: - Methods
    //
    mutating func setAvatar(name: String) {
        self.avatar = name
    }
    
    mutating func setPhotos(arrayNameByPhotos: [String]) {
        self.photos = arrayNameByPhotos
    }
}


extension User : Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        
        var flag = false
        
        if lhs.fullName == rhs.fullName {
            if lhs.gender == rhs.gender {
                if lhs.age == rhs.age {
                    if lhs.avatar == rhs.avatar {
                        if lhs.photos == rhs.photos {
                            flag = true
                        }
                    }
                }
            }
        }
        return flag
    }
}



class Frends {
    
    static var data = Frends()
    
    private var frends: [User]? = getUserArrayData()
    var count: Int {
        return frends?.count ?? 0
    }
    
    private var sectionsInfo = [(name: Character, count: Int, dataStartIndex: Int)]()
    var countSectionsInfo : Int {
        return sectionsInfo.count
    }
    
    
    // MARK: - Init
    //
    private init() { }
    
    
    
    // MARK: - Methods
    //
    func getUser(id: Int) -> User? {
        if id < frends?.count ?? 0 {
            return frends?[id]
        } else {
            return nil
        }
    }
    
    
    func sortByDown() {
        self.frends?.sort(by: { (userOne: User, UserTwo: User) -> Bool in
                        
            return userOne.lastName >= UserTwo.lastName
        })
        
        self.calculationSectionsInfo()
    }
                
    func sortByUp() {
        self.frends?.sort(by: { (userOne: User, UserTwo: User) -> Bool in
            
            return userOne.lastName < UserTwo.lastName
        })
        
        self.calculationSectionsInfo()
    }
    
    
    func getNumberOfRowsInSection(index: Int) -> Int? {
        
        var count: Int?
        if index < sectionsInfo.count {
            count = sectionsInfo[index].count
        }
        
        return count
    }
    
    func getLetterNameOfSection(index: Int) -> Character? {
        
        var char: Character?
        if index < sectionsInfo.count {
            char = sectionsInfo[index].name
        }
        
        return char
    }
    
    func getDataStartIndexInSection(index: Int) -> Int? {
        
        var dataIndex: Int?
        if index < sectionsInfo.count {
            dataIndex = sectionsInfo[index].dataStartIndex
        }
        
        return dataIndex
    }
    
    func copy() -> [User]? {
        return frends
    }
    
    func getRealIndex(user: User) -> Int? {
        
        return frends?.firstIndex(of: user)
    }
    
    private func calculationSectionsInfo() {
        
        if frends != nil {
            for (dataStartIndex, frend) in frends!.enumerated() {
                guard let char = frend.lastName.first else {
                    continue
                }
                
                if let index = checkLetterForPresence(char: char) {
                    sectionsInfo[index].count += 1
                } else {
                    let tuple = (name: char, count: 1, dataStartIndex: dataStartIndex)
                    sectionsInfo.append(tuple)
                }
            }
        }
    }
    
    private func checkLetterForPresence(char: Character) -> Int? {
        
        var check: Int? = nil
        
        for (index, section) in sectionsInfo.enumerated() {
            if section.name == char {
                check = index
                break
            }
        }
        return check
    }
}



//class FrendsGlobalSingleton : Frends {
//    
//    static var data = FrendsGlobalSingleton()
//
//
//    private override init() {
//        super.init()
//    }
//}


//  MARK:   - Get Data
//
private func getUserArrayData() -> [User]? {
    
    let data: [(String, String, User.Gender, UInt8, [String])] = [
        ("Иван", "Иванов", .Male, 20, ["001", "002", "003", "004", "005", "006", "007", "008"]),
        ("Петр", "Петров", .Male, 21, ["010", "011", "012", "013"]),
        ("Олег", "Зимин", .Male, 22, ["014", "015"]),
        ("Никита", "Фралов", .Male, 23, ["016", "017", "018"]),
        ("Ольга", "Садовская", .Female, 24, ["019", "068", "069", "070"]),
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
        var user = User(firstName: data[i].0, lastName: data[i].1, gender: data[i].2, age: data[i].3)
        user.setPhotos(arrayNameByPhotos: data[i].4)
        if i >= avatar.count {
            user.setAvatar(name: "")
        } else {
            user.setAvatar(name: avatar[i])
        }
        users.append(user)
    }
    
    return users
}
