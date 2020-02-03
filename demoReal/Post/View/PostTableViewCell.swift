//
//  PostTableViewCell.swift
//  demoReal
//
//  Created by Le Thanh Thanh Toai on 12/18/19.
//  Copyright © 2019 Le Thanh Thanh Toai. All rights reserved.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    private var onToggleCompleted : ((PostModel) -> Void)?
    private var obj: PostModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ obj: PostModel, onToggleCompleted: ((PostModel) -> Void)? = nil) {
        self.obj = obj
        self.onToggleCompleted = onToggleCompleted
        self.textLabel?.text = obj.name
        self.accessoryType = obj.isCompleted ? .checkmark : .none
    }
    
    func toggleCompleted() {
        guard let obj = obj else {
            fatalError("book not found")
        }
        onToggleCompleted?(obj)
    }
}

