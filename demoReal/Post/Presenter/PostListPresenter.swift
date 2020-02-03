//
//  PostListPresenter.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import RealmSwift

class PostListPresenter: PostListPresenterProtocol {
    
    func viewDidLoad() {
        interacter?.retrievePosts()
    }
    
    weak var view: PostListViewProtocol?
    weak var interacter: PostListInteractorInputProtocol?
    weak var wireFrame: PostListWireFrameProtocol?
    
    
}

extension PostListPresenter: PostListInteracterOutputProtocol {
    func didRetrievePosts(_ posts: Results<PostModel>) {
        view?.showPosts(with: posts)
    }
    
}
