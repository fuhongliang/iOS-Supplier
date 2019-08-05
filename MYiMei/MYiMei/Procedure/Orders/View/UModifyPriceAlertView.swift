//
//  UModifyPriceAlertView.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UModifyPriceAlertViewDelegate: AnyObject {
    func addPrice(orderId: Int,updatePrice:Int,updateExpress:Int)
    func reducePrice(orderId: Int,updatePrice:Int,updateExpress:Int)
}

class UModifyPriceAlertView : BaseView {
    
    //MARK:声明各种控件变量
    weak var delegate: UModifyPriceAlertViewDelegate?
    
    let subview = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth-96, height: 263))
    
    var mOrderId = 0
    
    var tipGoodsLabel = UILabel() // 商品价格输入框上面的提示
    var goodsLabel = UILabel() //商品价格
    var tipFreightLabel = UILabel() // 运费价格输入框上面的提示
    var freightLabel = UILabel() //运费价格
    var warnLabel = UILabel()
    var addPriceBtn = UIButton()
    
    var reducePriceBtn = UIButton()
    var inputFreightPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
    var inputGoodsPriceTF = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
    
    func configUI() {
        
        tipGoodsLabel.text = "修改订单中所有商品的总价格"
        tipGoodsLabel.font = UIFont.systemFont(ofSize: 15)
        tipGoodsLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipGoodsLabel)
        tipGoodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalToSuperview().offset(10)
        }
        
        goodsLabel.text = "商品价格:"
        goodsLabel.font = UIFont.systemFont(ofSize: 15)
        goodsLabel.textColor = UIColor.black
        subview.addSubview(goodsLabel)
        goodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        }
        
        //商品价格输入框
        
        inputGoodsPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputGoodsPriceTF.layer.borderWidth = 1
        inputGoodsPriceTF.layer.cornerRadius = 2
        inputGoodsPriceTF.keyboardType = UIKeyboardType.numberPad
        inputGoodsPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputGoodsPriceTF.leftViewMode = .always
        subview.addSubview(inputGoodsPriceTF)
        inputGoodsPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            //                ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.left.equalTo(goodsLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(190)
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(11)
        })
        
        tipFreightLabel.text = "修改的是订单中运费的价格"
        tipFreightLabel.font = UIFont.systemFont(ofSize: 15)
        tipFreightLabel.textColor = UIColor.hex(hexString: "#808080")
        subview.addSubview(tipFreightLabel)
        tipFreightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputGoodsPriceTF.snp.bottom).offset(20)
        }
        
        freightLabel.text = "运费价格:"
        freightLabel.font = UIFont.systemFont(ofSize: 15)
        freightLabel.textColor = UIColor.black
        subview.addSubview(freightLabel)
        freightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(35)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        }
        
        //运费价格输入框
        
        inputFreightPriceTF.keyboardType = UIKeyboardType.numberPad
        inputFreightPriceTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputFreightPriceTF.layer.borderWidth = 1
        inputFreightPriceTF.layer.cornerRadius = 2
        inputFreightPriceTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        inputFreightPriceTF.leftViewMode = .always
        subview.addSubview(inputFreightPriceTF)
        inputFreightPriceTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(freightLabel.snp.right).offset(5)
            ConstraintMaker.width.equalTo(190)
            ConstraintMaker.height.equalTo(35)
            //                ConstraintMaker.right.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipFreightLabel.snp.bottom).offset(11)
        })
        //
        
        warnLabel.text = "优惠的运费不能超过原来的运费"
        warnLabel.textColor = UIColor.hex(hexString: "#FF4444")
        warnLabel.font = UIFont.systemFont(ofSize: 15)
        subview.addSubview(warnLabel)
        warnLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(inputFreightPriceTF.snp.bottom).offset(15)
        }
        
        
        addPriceBtn.backgroundColor = UIColor.white
        addPriceBtn.setTitle("加价", for: .normal)
        addPriceBtn.setTitleColor(UIColor.hex(hexString: "#07D781"), for: UIControl.State.normal)
        addPriceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        subview.addSubview(addPriceBtn)
        addPriceBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.width.equalToSuperview().dividedBy(2)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.bottom.equalToSuperview()
        }
        addPriceBtn.addTarget(self, action: #selector(addPrice), for: UIControl.Event.touchDown)
        
        
        reducePriceBtn.backgroundColor = UIColor.white
        reducePriceBtn.setTitle("优惠", for: .normal)
        reducePriceBtn.setTitleColor(UIColor.hex(hexString: "#07D781"), for: UIControl.State.normal)
        reducePriceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        subview.addSubview(reducePriceBtn)
        reducePriceBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(addPriceBtn.snp.right)
            ConstraintMaker.width.equalToSuperview().dividedBy(2)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.bottom.equalToSuperview()
        }
        reducePriceBtn.addTarget(self, action: #selector(reducePrice), for: UIControl.Event.touchDown)
        
    }
    
    @objc func addPrice(){
        var goodspp:Int = 0
        var devily:Int = 0
        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }
        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }
        delegate?.addPrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
    }
    
    @objc func reducePrice(){
        var goodspp:Int = 0
        var devily:Int = 0
        if(inputGoodsPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputGoodsPriceTF.text ?? "0") {
                goodspp = goodsPrice
            }
        }
        if(inputFreightPriceTF.text?.count ?? 0 >= 0){
            if let goodsPrice = Int(inputFreightPriceTF.text ?? "0") {
                devily = goodsPrice
            }
        }
        delegate?.reducePrice(orderId: mOrderId, updatePrice: goodspp, updateExpress: devily)
    }
    
}
