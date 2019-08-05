//
//  UManagementClassificationCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UManagementClassificationCell: UBaseTableViewCell {
    
    var editCategory : (() -> ())?
    var deleteCategory : (() -> ())?

    //字段说明
    var seriesLaber : UILabel = {
        let seriesLaber = UILabel()
        seriesLaber.text = "现代系列"
        seriesLaber.textColor = UIColor.hex(hexString: "#666666")
        seriesLaber.font = UIFont.systemFont(ofSize: 17)
        return seriesLaber
    }()
    //按钮
    var editBtn : UIButton = {
        let eb = UIButton()
        eb.backgroundColor = UIColor.white
        eb.setTitle("编辑", for: UIControl.State.normal)
        eb.setTitleColor(UIColor.black, for: UIControl.State.normal)
        eb.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        eb.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        eb.layer.borderWidth = 1
        eb.layer.cornerRadius = 2
        return eb
    }()
    
    var deleteBtn : UIButton = {
        let delBtn = UIButton()
        delBtn.backgroundColor = UIColor.white
        delBtn.setTitle("删除", for: UIControl.State.normal)
        delBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        delBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        delBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        delBtn.layer.borderWidth = 1
        delBtn.layer.cornerRadius = 2
        return delBtn
    }()
    
    var layerView: UIView = {
        let layerView = UIView()
        layerView.backgroundColor = UIColor.white
        return layerView
    }()

    var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        return line
    }()

    override func configUI() {

        contentView.addSubview(layerView)
        layerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalToSuperview()
            ConstraintMaker.width.equalToSuperview()
        }
        
        layerView.addSubview(seriesLaber)
        seriesLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.left.equalToSuperview().offset(15)
        }

        layerView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(68)
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        layerView.addSubview(editBtn)
        editBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalToSuperview()
            ConstraintMaker.right.equalTo(deleteBtn.snp.left).offset(-15)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.width.equalTo(68)
        }

        layerView.addSubview(line)
        line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.equalToSuperview()
            
        }
        
        editBtn.addTarget(self, action: #selector(tapEditCat), for: UIControl.Event.touchDown)
        deleteBtn.addTarget(self, action: #selector(tapDeleteCat), for: UIControl.Event.touchDown)
    
        
    }
    
    
    @objc func tapEditCat(){
        editCategory?()
    }
    
    @objc func tapDeleteCat(){
        deleteCategory?()
    }
    
    var model: CategoryModel? {
        didSet {
            guard let model = model else { return }
            seriesLaber.text = model.name
            
        }
    }
    
}
