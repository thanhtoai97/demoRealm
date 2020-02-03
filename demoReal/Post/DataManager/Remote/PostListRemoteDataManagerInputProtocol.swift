//
//  PostListRemoteDataManagerProtocol.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation

protocol PostListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandle: PostListRemoteDataManagerInputProtocol? {get set}
    
    // INTERACTER -> REMOTEDATA
    func retrievePostList()
}
