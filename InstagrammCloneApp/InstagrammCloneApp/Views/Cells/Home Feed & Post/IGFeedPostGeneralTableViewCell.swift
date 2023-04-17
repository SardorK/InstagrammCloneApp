//
//  IGFeedPostGeneralTableViewCell.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 12/02/23.
//

import UIKit

class IGFeedPostGeneralTableViewCell: UITableViewCell {

    static let identefier = "IGFeedPostGeneralTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(){
        
    }
}
