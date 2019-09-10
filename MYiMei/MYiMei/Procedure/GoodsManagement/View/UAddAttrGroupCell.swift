//
//  UAddAttrGroupCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAddAttrGroupCell: UBaseTableViewCell {
    
    var addGroup : ((_ groupName:String) -> ())?
    
    //MARK:添加按钮
    var addBtn :  UIButton = {
        let ub = UIButton()
        ub.setTitle("添加", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        ub.layer.cornerRadius = 3
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return ub
    }()
    
    //MARK:分组名输入框
    var groupNameInput : UITextField = {
        let utf = UITextField()
        utf.placeholder = "请输入规格组如颜色、尺码、套餐"
        utf.backgroundColor = UIColor.white
        return utf
    }()
    
    override func configUI() {
        
        //TODO 添加topView bottomView
        
        contentView.addSubview(groupNameInput)
        groupNameInput.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-40)
            ConstraintMaker.top.equalToSuperview()
        }
        
        contentView.addSubview(addBtn)
        addBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(groupNameInput)
            ConstraintMaker.height.equalTo(25)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.width.equalTo(44)
        }
        addBtn.addTarget(self, action: #selector(tapAddGroup), for: UIControl.Event.touchUpInside)
    }
    
    @objc func tapAddGroup(){
        
        addGroup?(groupNameInput.text ?? "")
        groupNameInput.text = ""
    }
    
}
