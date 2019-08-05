//
//  URefundOrderImageCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/29.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class URefundOrderImageCell: UBaseCollectionViewCell {
    
    var pic:UIImageView = {
        let pic = UIImageView(frame: CGRect(x: 0, y: 0, width: 61, height: 61))
        pic.layer.cornerRadius = 3
        pic.layer.masksToBounds = true
        return pic
    }()
    
    override func configUI() {
        
        contentView.addSubview(pic)
    }
    
    var data: String? {
        didSet {
            guard data != nil else { return }
            
            let pic_url = URL(string: data!)
            pic.kf.setImage(with: pic_url)
            
        }
    }
    
}
