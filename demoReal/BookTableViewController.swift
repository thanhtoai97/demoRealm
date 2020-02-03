//
//  BookTableViewController.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/16/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import UIKit
import RealmSwift

class BookTableViewController: UITableViewController {
    
    private var books: Results<BookItem>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        books = BookItem.getAll()
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        token = books?.observe({[weak tableView] changes in
            guard let tableView = tableView else {
                return
            }
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_,let deletions, let insertions, let modifications):
                tableView.applyChange(deletions: deletions, insertions: insertions, updates: modifications)
            case .error:
                break
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        token?.invalidate()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books?.count ?? 0
    }

    @IBAction func onAddButtonClicked(_ sender: Any) {
        showInputBookAlert("add book name") { name in
            BookItem.add(name: name)
            //self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell,
        let book = books?[indexPath.row] else {
            return BookTableViewCell(frame: .zero)
        }
        
        cell.configureWith(book) { [weak self ] book in
            book.toggleChange()
            //self?.tableView.reloadData()
        }
       

        return cell
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookTableViewCell else {
            return
        }
        
        cell.toggleCompleted()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let book = books?[indexPath.row],
            editingStyle == .delete
        else {
               return
        }
        
        book.delete()
        //tableView.reloadData()
    }

}

extension UITableView {
    func applyChange(deletions: [Int], insertions: [Int], updates: [Int]) {
        beginUpdates()
        deleteRows(at: deletions.map{IndexPath(row: $0, section: 0)}, with: .automatic)
        insertRows(at: insertions.map{IndexPath(row: $0, section: 0)}, with: .automatic)
        reloadRows(at: updates.map({IndexPath(row: $0, section: 0)}), with: .automatic)
        
        endUpdates()
    }
}
