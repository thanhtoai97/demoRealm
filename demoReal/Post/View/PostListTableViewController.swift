//
//  PostListTableViewController.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import UIKit
import RealmSwift

class PostListTableViewController: UITableViewController {

    var presenter: PostListPresenterProtocol?
    private var objs : Results<PostModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? PostTableViewCell,
        let obj = objs?[indexPath.row] else {
            return BookTableViewCell(frame: .zero)
        }
        
        cell.configureWith(obj) { [weak self ] obj in
            obj.toggleChange()
            //self?.presenter?.toggleChange()
            //self?.tableView.reloadData()
        }
       

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PostTableViewCell else {
            return
        }
        
        cell.toggleCompleted()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let obj = objs?[indexPath.row],
            editingStyle == .delete
        else {
               return
        }
        
        //self.presenter?.delete()
        obj.toggleDelete()
        //tableView.reloadData()
    }
    
    func showInputBookAlert(_ title: String, isSecure: Bool = false, text: String? = nil, callback: @escaping (String) -> Void) {
      let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
      alert.addTextField(configurationHandler: { field in
        field.isSecureTextEntry = isSecure
        field.text = text
      })

      alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
        guard let text = alert.textFields?.first?.text, !text.isEmpty else {
            self.showInputBookAlert(title, callback: callback)
          return
        }

        callback(text)
      })

      let root = UIApplication.shared.keyWindow?.rootViewController
      root?.present(alert, animated: true, completion: nil)
    }

}

extension PostListTableViewController: PostListViewProtocol {
    
    func showPosts(with posts: Results<PostModel>) {
        objs = posts
    }
}
