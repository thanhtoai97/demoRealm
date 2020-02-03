//
//  PostListInteracterProtocol.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import RealmSwift

protocol PostListInteracterOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    
    func didRetrievePosts(_ posts: Results<PostModel>)
    
}


protocol PostListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PostListInteracterOutputProtocol? {get set}
    
    func retrievePosts()
    
}
