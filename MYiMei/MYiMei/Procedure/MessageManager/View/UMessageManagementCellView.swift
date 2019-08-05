//
//  UMessageManagementCellView.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/16.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMessageManagementCellView: UBaseTableViewCell {
//    //背景
//    var whiteBg = UIImageView()
    //标题
    var title = UILabel()
    
    //订单时间
    var addTime = UILabel()
    
    //内容
    var content = UILabel()
    
    override func configUI() {
        contentView.backgroundColor = UIColor.white
//        contentView.addSubview(whiteBg)
//        whiteBg.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.left.equalToSuperview()
//            ConstraintMaker.top.equalToSuperview()
//            ConstraintMaker.right.equalToSuperview()
//            ConstraintMaker.height.equalTo(66)
//        }
        title.text = "新订单"
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(title)
        title.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(15)
        }
        
        addTime.textColor = UIColor.hex(hexString: "#808080")
        addTime.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(addTime)
        addTime.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(title)
            ConstraintMaker.left.equalTo(title.snp.right).offset(15)
        }
        
        content.text = "显示内容显示内容"
        content.textColor = UIColor.hex(hexString: "#999999")
        content.font = UIFont.systemFont(ofSize: 12)
        content.numberOfLines = 0
        contentView.addSubview(content)
        content.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(title.snp.bottom).offset(10)
            ConstraintMaker.right.bottom.equalToSuperview().offset(-15)
//            ConstraintMaker.bottom.equalToSuperview().offset(-15)
        }
    }
    
    var model: MessageInfo? {
        didSet {
            guard let model = model else { return }
            title.text = model.msg_type
            addTime.text = dateForMatter(timeString: model.addtime, join: " ")
            content.text = model.msg_content
        }
    }
}
