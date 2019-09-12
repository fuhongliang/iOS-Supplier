//  设置每个规格的库存
//  UAttrCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/14.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UAttrCell: UBaseTableViewCell {
    
    var setInventory : ((_ text:String) -> ())?
    var setPrice : ((_ text:String) -> ())?
    var setItemNum : ((_ text:String) -> ())?
    
    //MARK:规格名
    var attrName : UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:规格名下的🧵
    var attrLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:库存
    var inventory : UILabel = {
        let ul = UILabel()
        ul.text = "库存"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:库存量
    var inventoryNumber :  UITextField = {
        let ub = UITextField()
        ub.textColor = UIColor.hex(hexString: "#FF4444")
        ub.font = UIFont.systemFont(ofSize: 15)
        ub.textAlignment = .center
        ub.keyboardType = .numberPad
        ub.tag = 1001
        return ub
    }()
    
    //MARK:库存右边的🧵
    var inventoryLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:价格
    var price : UILabel = {
        let ul = UILabel()
        ul.text = "价格"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:价格---数字
    var priceNumber :  UITextField = {
        let ub = UITextField()
        ub.textColor = UIColor.hex(hexString: "#FF4444")
        ub.font = UIFont.systemFont(ofSize: 15)
        ub.textAlignment = .center
        ub.keyboardType = .decimalPad
        ub.tag = 1002
        return ub
    }()
    
    //MARK:库存和价格下的🧵
    var attrPriceLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:货号
    var itemNumLabel : UILabel = {
        let ul = UILabel()
        ul.text = "货号"
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    
    //MARK:货号---数字
    var itemNumber :  UITextField = {
        let ub = UITextField()
        ub.textColor = UIColor.hex(hexString: "#FF4444")
        ub.font = UIFont.systemFont(ofSize: 15)
        ub.textAlignment = .center
        ub.keyboardType = .numberPad
        ub.tag = 1003
        return ub
    }()
    
    //MARK:灰色分割线
    var grayRect : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.background
        return uv
    }()
    
    override func configUI() {
        
        //MARK:规格名
        contentView.addSubview(attrName)
        attrName.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(12)
        }
        
        //MARK:规格名下的🧵
        contentView.addSubview(attrLine)
        attrLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(attrName.snp.bottom).offset(12)
            ConstraintMaker.left.equalTo(attrName)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:中间的竖线
        contentView.addSubview(inventoryLine)
        inventoryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalTo(1)
            ConstraintMaker.height.equalTo(25)
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(attrLine.snp.bottom).offset(9)
        }
        
        //MARK:库存
        contentView.addSubview(inventory)
        inventory.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(inventoryLine)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.width.equalTo(40)
        }
        
        //MARK:库存---数字🔢
        contentView.addSubview(inventoryNumber)
        inventoryNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(inventoryLine)
            ConstraintMaker.left.equalTo(inventory.snp.right).offset(2)
            ConstraintMaker.right.equalTo(inventoryLine.snp.left).offset(-2)
        }
        inventoryNumber.delegate = self
        
        //MARK:价格
        contentView.addSubview(price)
        price.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(inventoryLine.snp.right).offset(10)
            ConstraintMaker.centerY.equalTo(inventoryLine)
            ConstraintMaker.width.equalTo(40)
        }
        
        //MARK:价格---数字🔢
        contentView.addSubview(priceNumber)
        priceNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(inventoryLine)
            ConstraintMaker.left.equalTo(price.snp.right).offset(2)
            ConstraintMaker.right.equalToSuperview().offset(-2)
        }
        priceNumber.delegate = self
        
        //MARK:库存价格下的🧵
        contentView.addSubview(attrPriceLine)
        attrPriceLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(inventoryLine.snp.bottom).offset(9)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:货号
        contentView.addSubview(itemNumLabel)
        itemNumLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(attrPriceLine.snp.bottom).offset(10)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.width.equalTo(40)
        }
        
        //MARK:货号---数字🔢
        contentView.addSubview(itemNumber)
        itemNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(itemNumLabel)
            ConstraintMaker.left.equalTo(itemNumLabel.snp.right).offset(2)
            ConstraintMaker.right.equalTo(inventoryLine.snp.left).offset(-2)
        }
        itemNumber.delegate = self
        
        //MARK:灰色分割线
        contentView.addSubview(grayRect)
        grayRect.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(7)
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
        }
        
    }

    var model : AttrValue? {
        didSet {
            guard model != nil else { return }
            attrName.text = model!.attrName
            
            inventoryNumber.text = model!.inventory
            priceNumber.text = "¥\(model!.price)"
            itemNumber.text = model!.goodsNumber
            
        }
    }
    
}

extension UAttrCell : UITextFieldDelegate {
    
    //MARK:获取焦点
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1001:
            setInventory?(textField.text ?? "")
        case 1002:
            let text = textField.text!
            let startRang = text.range(of: "¥")!
            setPrice?(String(text[startRang.upperBound...]))
        case 1003:
            setItemNum?(textField.text ?? "")
        default:
            break
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField.tag == 1002 else { return true }
        if string == "." {
            if textField.text?.count == 1 || textField.text!.contains(".") {//只允许输入一个小数点
                return false
            }
        } else if string == "" {
            return range.location != 0 //不允许删除首个符号
        } else {
            let text = textField.text! + string
            let startRang = text.range(of: "¥")!
            if let point = textField.text?.range(of: ".") { //如果小数点后超过两位 则不再允许输入
                return text[point.upperBound...].count <= 3 // (这里截取会带上小数点 待解决)
            }
            let num = Double(text[startRang.upperBound...]) ?? 0 //如果大于99999999.99也不再允许输入
            return num <= 999999999.99
        }
        return true
    }
    
}

