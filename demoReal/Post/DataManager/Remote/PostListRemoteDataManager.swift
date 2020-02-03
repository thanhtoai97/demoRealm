//
//  PostListRemoteDataManager.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol {
    var remoteRequestHandle: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        
    }
    
    
}

extension PostListRemoteDataManager: PostListRemoteDataManagerOutputProtocol {
    func onPostRetrieve() {
        
    }
    
    func onError() {
        
    }
    
    
}
