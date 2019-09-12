//
//  USetAllAlertView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/19.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class USetAllAlertView: UIView {
    
    
    
    
    func configUI(){
        
        //MARK:最外层布局
        var outerLayer : UIView = {
            let uv = UIView(frame: CGRect.init(x: 0, y: 0, width: 270, height: 138))
            return uv
        }()
        
        //MARK:库存文本
        var inventory : UILabel = {
            let ul = UILabel()
            ul.font = UIFont.systemFont(ofSize: 15)
            ul.text = "库存"
            ul.textColor = UIColor.hex(hexString: "#333333")
            return ul
        }()
        
        //MARK:库存输入框
        var inventoryTF :  UITextField = {
            let utf = UITextField()
            utf.placeholder = "请填写库存数量"
            return utf
        }()
        
        //MARK:库存⤵️的🧵
        var inventoryLine : UIView = {
            let uv = UIView()
            uv.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
            return uv
        }()
        
        //MARK:价格文本
        var price : UILabel = {
            let ul = UILabel()
            ul.font = UIFont.systemFont(ofSize: 15)
            ul.text = "价格"
            ul.textColor = UIColor.hex(hexString: "#333333")
            return ul
        }()
        
        //MARK: ¥ 符号
        var money : UILabel = {
            let ul = UILabel()
            ul.text = "¥ "
            ul.textColor = UIColor.hex(hexString: "#333333")
            return ul
        }()
        
        //MARK:价格输入框
        var priceTF :  UITextField = {
            let utf = UITextField()
            utf.placeholder = "请填写价格"
            return utf
        }()
        
        //MARK:价格⤵️的🧵
        var priceLine : UIView = {
            let uv = UIView()
            uv.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
            return uv
        }()
        
        //MARK:货号文本
        var goodsNumber : UILabel = {
            let ul = UILabel()
            ul.font = UIFont.systemFont(ofSize: 15)
            ul.text = "货号"
            ul.textColor = UIColor.hex(hexString: "#333333")
            return ul
        }()
        
        //MARK:货号输入框
        var goodsNumberTF :  UITextField = {
            let utf = UITextField()
            utf.placeholder = "请填写商品货号"
            return utf
        }()
        
        //MARK:货号⤵️的🧵
        var goodsNumberLine : UIView = {
            let uv = UIView()
            uv.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
            return uv
        }()
        
        //MARK:外层view
//        self.addSubview(outerLayer)
//        outerLayer.snp.makeConstraints { (ConstraintMaker) in
//            ConstraintMaker.width.equalTo(270)
//            ConstraintMaker.left.equalToSuperview()
//            ConstraintMaker.height.equalTo(138)
//        }
        
        //MARK:库存
        self.addSubview(inventory)
        inventory.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalToSuperview()
        }
        
        //MARK:库存输入框
        self.addSubview(inventoryTF)
        inventoryTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(inventory.snp.right)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.centerY.equalTo(inventory)
        }
        
        //MARK:库存下面的线
        self.addSubview(inventoryLine)
        inventoryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.top.equalTo(inventoryTF.snp.bottom)
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:价格
        self.addSubview(price)
        price.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(inventoryLine.snp.bottom).offset(10)
        }
        
        //MARK: ¥ 符号
        self.addSubview(money)
        money.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(price.snp.right).offset(10)
            ConstraintMaker.centerY.equalTo(price)
        }
        
        //MARK:价格输入框
        self.addSubview(priceTF)
        priceTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(money.snp.right)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.centerY.equalTo(price)
        }
        
        //MARK:价格下面的线
        self.addSubview(priceLine)
        priceLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.top.equalTo(priceTF.snp.bottom)
            ConstraintMaker.height.equalTo(1)
        }
        
        //MARK:货号
        self.addSubview(goodsNumber)
        goodsNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(priceLine.snp.bottom).offset(10)
        }
        
        //MARK:货号输入框
        self.addSubview(goodsNumberTF)
        goodsNumberTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsNumber.snp.right)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.centerY.equalTo(goodsNumber)
        }
        
        //MARK:货号下面的线
        self.addSubview(goodsNumberLine)
        goodsNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.top.equalTo(goodsNumberTF.snp.bottom)
            ConstraintMaker.height.equalTo(1)
        }
        
    }
    
}
