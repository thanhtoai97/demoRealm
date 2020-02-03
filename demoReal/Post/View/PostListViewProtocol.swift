//
//  PostListViewProtocol.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import RealmSwift

protocol PostListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: PostListPresenterProtocol? {get set}
    
    func showPosts(with posts: Results<PostModel>)
    
}
