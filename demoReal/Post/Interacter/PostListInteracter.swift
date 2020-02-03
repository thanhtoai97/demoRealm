//
//  PostListInteracter.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import RealmSwift

class PostListInteracter: PostListInteractorInputProtocol {
    func retrievePosts() {
        return ((presenter?.didRetrievePosts(PostModel.getAll()))!)
    }
    
    var presenter: PostListInteracterOutputProtocol?
    
}
