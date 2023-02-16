//
//  ProfileTableCollectionReusableView.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 13/02/23.
//

import UIKit

class ProfileTableCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTableCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
