//
//  ToDoItem.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation
import CoreData


struct APIItem: Identifiable {
    var id = UUID()
    var name: String = ""
    var itemsDump: Items!
    var dumpStr: String {
        let data = try! JSONEncoder().encode(itemsDump)
        return String(data: data, encoding: .utf8)!
    }

    init(name: String, dump: Items) {
        self.name = name
        self.itemsDump = dump
    }
}
