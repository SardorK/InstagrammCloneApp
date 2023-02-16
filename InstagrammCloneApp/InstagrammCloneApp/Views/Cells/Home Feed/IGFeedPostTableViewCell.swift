//
//  IGFeedPostTableViewCell.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 12/02/23.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identefier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(){
        
    }
}
