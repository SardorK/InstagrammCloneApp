//
//  IGFeedPostActionsTableViewCell.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 12/02/23.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let identefier = "IGFeedPostActionsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(){
        
    }

}
