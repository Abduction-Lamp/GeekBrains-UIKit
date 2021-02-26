//
//  Group.swift
//  VK-UIKit
//
//  Created by Владимир on 10.02.2021.
//

import Foundation


struct Group {
    
    var name: String
    var avatar: String?
    
    init(name: String) {
        self.name = name
    }
}


//  MARK:   - Protocol Equatable
//
extension Group : Equatable {
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}



class AllGroups {
    
    static var data = AllGroups()
    
    private var groups: [Group]? = getAllGroupData()
    var count: Int {
        return groups?.count ?? 0
    }
    
    private init() { }
    
    func getGroup(id: Int) -> Group? {
        return groups?[id]
    }
    
    func remove(id: Int) -> Bool {
        var flag = false
        let count = groups?.count ?? 0
        
        if id <= count {
            groups?.remove(at: id)
            flag = true
        }
        return flag
    }
    
    func copy() -> [Group]? {
        return groups
    }
}


class MyGroups {
    
    static var data = MyGroups()
    
    private var groups: [Group]? = getMyGroupData()
    var count: Int {
        return groups?.count ?? 0
    }
    
    private init() { }
    
    func getGroup(id: Int) -> Group? {
        return groups?[id]
    }
    
    func remove(id: Int) -> Bool {   
        var flag = false
        let count = groups?.count ?? 0
        
        if id <= count {
            groups?.remove(at: id)
            flag = true
        }
        return flag
    }
    
    func contains(group: Group) -> Bool {
        return groups?.contains(group) ?? true
    }
    
    func append(group: Group) -> Void{
        groups?.append(group)
    }
}



//  MARK:   - Get Data
//
private func getAllGroupData() -> [Group]? {
    
    let data: [(name: String, avatar: String)] = [
        ("Все о телескопах", "GROUP-002-telescope"),
        ("Спорт-Спорт-Спорт", "GROUP-005-sports"),
        ("Юный Химик", "GROUP-006-chemistry"),
        ("Инвестиции и рынок ценных бумаг", "GROUP-010-scholarship"),
        ("You Rock My World", "GROUP-013-playlist"),
        ("Группа молекулярной биологии", "GROUP-014-microscope"),
        ("Книжный червь", "GROUP-016-library"),
        ("Клуб путешевственников", "GROUP-018-earth-globe"),
        ("iOS-разработка", "GROUP-024-computer"),
        ("Автозапчасти", "GROUP-025-gears"),
        ("Юный Физик", "GROUP-027-physics"),
        ("Cтуденческая группа Geekbrains", "GROUP-029-brainstorm"),
        ("«Поехали»! Российский космос", "GROUP-033-astronaut"),
        ("Художественный класс", "GROUP-034-paint-palette")
    ]
    
    guard data.count > 0 else {
        return nil
    }
    
    var groups = [Group]()
    
    for i in 0 ..< data.count {
        var group = Group(name: data[i].name)
        group.avatar = data[i].avatar
        groups.append(group)
    }
    
    return groups
}


private func getMyGroupData() -> [Group]? {
    
    var groups = [Group]()
    
    var group = Group(name: "«Поехали»! Российский космос")
    group.avatar = "GROUP-033-astronaut"
    groups.append(group)
    
    return groups
}

