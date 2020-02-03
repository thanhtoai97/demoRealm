//
//  PostListWireFrame.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import UIKit

class PostListWireFrame: PostListWireFrameProtocol {
   
    static func createPostListModel() -> PostListTableViewController? {
        let navController = mainStoryboard.instantiateViewController(identifier: "PostNavController")
        if let view = navController.children.first as? PostListTableViewController {
            let presenter: PostListPresenterProtocol & PostListInteracterOutputProtocol = PostListPresenter()
            let interacter: PostListInteractorInputProtocol = PostListInteracter()
            let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
            
            view.presenter = presenter
            presenter.interacter = interacter
            presenter.wireFrame = wireFrame
            
            interacter.presenter = presenter
            
            return navController as! PostListTableViewController
        }
        
        return UIViewController() as! PostListTableViewController
    }
    
    static var mainStoryboard : UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
