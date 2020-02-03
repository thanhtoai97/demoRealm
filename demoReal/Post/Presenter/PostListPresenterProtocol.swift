//
//  PostListProtocol.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation

protocol PostListPresenterProtocol: class {
    var view: PostListViewProtocol? {get set }
    var interacter: PostListInteractorInputProtocol? {get set}
    var wireFrame: PostListWireFrameProtocol? {get set}
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    
}
