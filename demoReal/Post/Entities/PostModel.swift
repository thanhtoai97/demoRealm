//
//  PostModel.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class PostModel: Object {
    enum Property: String {
        case id, name, isCompleted
    }
    
    dynamic var id = UUID().uuidString
    dynamic var name = ""
    dynamic var isCompleted = false
    
    override class func primaryKey() -> String? {
        return PostModel.Property.id.rawValue
    }
    
    convenience init(_ name: String) {
        self.init()
        self.name = name
    }
    
    func toggleChange() {
        guard let realm = realm else {
            return
        }
        
        try! realm.write {
            isCompleted = !isCompleted
        }
    }
    
    func toggleDelete() {
        guard let realm = realm else {
            return
        }
        
        try! realm.write {
            realm.delete(self)
        }
    }
}

extension PostModel {
    // ADD object
    static func addObject(name: String, realm : Realm = try! Realm()) -> PostModel {
        let obj = PostModel(name)
        try! realm.write {
            realm.add(obj)
        }
        
        return obj
    }
    
    // GET all object
    static func getAll(realm : Realm = try! Realm()) -> Results<PostModel> {
        return realm.objects(PostModel.self).sorted(byKeyPath: PostModel.Property.id.rawValue)
    }
}
