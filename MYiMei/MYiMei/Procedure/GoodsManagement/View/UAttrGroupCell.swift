//
//  UAttrGroupCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/14.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAttrGroupCell: UBaseTableViewCell{
    
    //删除整个规格组
    var deleteGroup : (() -> ())?
    
    //删除规格
    var deleteAttr : ((_ attrIndex:Int) -> ())?
    
    //添加规格
    var addAttr : (() -> ())?
    
    //MARK:规格组名称
    var groupNameLabel : UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:删除按钮
    var deleteBtn :  UIButton = {
        let ub = UIButton()
        ub.setTitleColor(UIColor.hex(hexString: "#999999"), for: .normal)
        ub.setTitle("删除", for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return ub
    }()
    
    var topView = UIView()
    var bottomView = UIView()
    
    override func configUI() {
    
        //MARK:规格组名称
        contentView.addSubview(groupNameLabel)
        groupNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalToSuperview().offset(7)
            ConstraintMaker.width.equalTo(70)
        }
        
        //MARK:删除按钮
        contentView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(groupNameLabel)
            ConstraintMaker.right.equalToSuperview().offset(-5)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(50)
        }
        deleteBtn.addTarget(self, action: #selector(tapDeleteGroup), for: UIControl.Event.touchUpInside)
    
        
    }
    
    @objc func tapDeleteGroup() {
        deleteGroup?()
    }
    
    @objc func tapDeleteAttr(btn:UIButton) {
        deleteAttr?(btn.tag)
    }
    
    @objc func tapAddAttr(){
        addAttr?()
    }
    
    
    //MARK:生成规格视图
    func generateAttrView(i:Int) -> UIView{
        //添加的规格视图
        let borderView = UIView()
        borderView.backgroundColor = UIColor.white
        borderView.layer.borderColor = UIColor.hex(hexString: "#999999").cgColor
        borderView.layer.borderWidth = 0.5
        borderView.layer.cornerRadius = 3
        borderView.tag = 111
        
        //规格名
        let attrName = UILabel()
        attrName.text = groupArray![i].attrName
        attrName.textColor = UIColor.hex(hexString: "#333333")
        attrName.font = UIFont.systemFont(ofSize: 13)
        
        //删除规格按钮
        let deleteAttr = UIButton()
        deleteAttr.setImage(UIImage.init(named: "delete_attr"), for: .normal)
        deleteAttr.tag = i
        deleteAttr.addTarget(self, action: #selector(tapDeleteAttr), for: UIControl.Event.touchUpInside)
        
        borderView.addSubview(attrName)
        attrName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.centerY.equalToSuperview()
        }
        borderView.addSubview(deleteAttr)
        deleteAttr.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-10)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.size.equalTo(13)
        }
        contentView.addSubview(borderView)
        return borderView
    }
    
    //MARK:生成添加视图
    func generateAddAttrView() -> UIView {
        
        let addBtn = UIButton()
        addBtn.backgroundColor = UIColor.white
        addBtn.layer.borderColor = UIColor.hex(hexString: "#1C98F6").cgColor
        addBtn.layer.borderWidth = 0.5
        addBtn.layer.cornerRadius = 3
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        addBtn.setTitle("＋添加", for: .normal)
        addBtn.setTitleColor(UIColor.hex(hexString: "#1C98F6"), for: .normal)
        addBtn.addTarget(self, action: #selector(tapAddAttr), for: UIControl.Event.touchUpInside)
        
        //添加的规格视图
        let borderView = UIView()
        borderView.backgroundColor = UIColor.white
        borderView.tag = 111
        
        borderView.addSubview(addBtn)
        addBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalToSuperview()
        }
        contentView.addSubview(borderView)
        return borderView
    }
    
    var groupName : String? {
        didSet {
            guard groupName != nil else { return }
            groupNameLabel.text = groupName
        }
    }
    
    var groupArray : Array<AttrData>? {
        didSet {
            guard groupArray != nil else { return }
            
            /*第二种方案:手动调整布局*/
            for i in contentView.subviews {
                if i.tag == 111 {
                    i.removeFromSuperview()//这里先删掉之前加载的布局view
                }
            }
            var groupViewArray = Array<UIView>()
            for (index, _) in groupArray!.enumerated(){
                groupViewArray.append(generateAttrView(i: index))
            }
            groupViewArray.append(generateAddAttrView())
            for (index, item) in groupViewArray.enumerated() {
                item.snp.makeConstraints { (make) in
                    make.top.equalTo(40*(index/3+1))
                    make.width.equalToSuperview().dividedBy(3).inset(6.5)
                    make.height.equalTo(30)
                    if index%3 == 0 { //每层的首个
                        make.left.equalToSuperview().offset(10)
                    } else {
                        make.left.equalTo(groupViewArray[index - 1].snp.right).offset(10)
                    }
                    if index+1%3 == 0{ //每层的末尾
                        make.right.equalToSuperview().offset(-10)
                    }

                }
            }
            
        }
    }
    
}
