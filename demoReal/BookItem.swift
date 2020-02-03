//
//  BookItem.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/16/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper

@objcMembers class BookItem: Object {
    enum Property : String {
        case id, name, isCompleted
    }
    
    dynamic var id = UUID().uuidString
    dynamic var name = ""
    dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return BookItem.Property.id.rawValue
    }
    
    override class func indexedProperties() -> [String] {
        return ["name"]
    }
    
    convenience init(_ name: String) {
        self.init()
        self.name = name
    }
    
    let number = RealmOptional<Int>()
    
    func toggleChange() {
        guard let realm = realm else {
            return
        }
        
        try! realm.write {
            isCompleted = !isCompleted
        }
    }
    
    func delete() {
        guard let realm = realm else {
            return
        }
        try! realm.write {
            realm.delete(self)
        }
        
    }
}

extension BookItem {
    static func add (name: String, in realm: Realm = try! Realm()) -> BookItem {
        let book = BookItem(name)
        try! realm.write {
            realm.add(book)
        }
        
        return book
    }
    
    static func getAll(in realm: Realm = try! Realm()) -> Results<BookItem> {
        return realm.objects(BookItem.self).sorted(byKeyPath: BookItem.Property.isCompleted.rawValue)
    }
    
    static func getObjectFirst() -> BookItem?{
        let realm = try! Realm()
        
        return realm.objects(BookItem.self).first
    }
    
    static func Filter() -> Int {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "name = %@ AND name BEGINSWITH %@", "ten", "B")
        let result =  realm.objects(BookItem.self).filter(predicate)
        return result.count
        
    }
    
}
