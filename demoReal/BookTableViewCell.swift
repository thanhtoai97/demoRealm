//
//  BookTableViewCell.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/16/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    private var onToggleCompleted : ((BookItem) -> Void)?
    private var book : BookItem?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ book: BookItem, onToggleCompleted: ((BookItem) -> Void)? = nil) {
        self.book = book
        self.onToggleCompleted = onToggleCompleted
        self.textLabel?.text = book.name
        self.accessoryType = book.isCompleted ? .checkmark : .none
    }
    
    func toggleCompleted() {
        guard let book = book else {
            fatalError("book not found")
        }
        onToggleCompleted?(book)
    }

}
