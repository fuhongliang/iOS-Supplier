//
//  UChooseAttrController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import SCLAlertView

protocol UChooseAttrControllerProtocol {
    func attrDataBack(attrGroupData:SetAttrDataModel, attrArray:AttrArray)
}

class UChooseAttrController: UBaseViewController {
    var attrDelegate : UChooseAttrControllerProtocol?
    
    var attrData = SetAttrDataModel()
    var attrValue = AttrArray()//商品规格的具体信息
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
        tw.showsVerticalScrollIndicator = false
        tw.delegate = self
        tw.dataSource = self
        
        tw.register(cellType: UAddAttrGroupCell.self)
        tw.register(cellType: UAttrGroupCell.self)
        tw.register(cellType: UBatchSetPriceInventoryCell.self)
        tw.register(cellType: UAttrCell.self)
        return tw
    }()
    
    
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", target: self, action: #selector(tapSaveAttrAction))
    }
    
    //MARK:保存规格 回传到上层
    @objc func tapSaveAttrAction(){
        if let delegate = attrDelegate {
            for i in attrData.group {
                for _ in i.attr { //判断是否有设置规格数据
                    delegate.attrDataBack(attrGroupData:attrData, attrArray: attrValue)
                    self.pressBack()
                    return
                }
            }
            self.pressBack()
        }
        
    }
    
}

extension UChooseAttrController : UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {

        //分别判断不同情况下的section数量
        if attrData.group.count <= 0 {
            return 1
        } else if attrValue.attrValueArray.count <= 0 {
            return 1 + attrData.group.count
        } else {
            return 1 + attrData.group.count + 1 + 1//添加组 组 批量设置 规格
        }
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1+attrData.group.count+1 {
            return attrValue.attrValueArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        } else if (indexPath.section <= attrData.group.count) {
            
            return CGFloat(80 + ((attrData.group[indexPath.section - 1].attr.count / 3) * 40)) //计算每多出一行的高度
        } else if (indexPath.section == attrData.group.count+1) {
            return 44
        } else {
            return 137
        }
    }
    
    //MARK:cell头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        } else if (section == (1 + attrData.group.count + 1)){
            return 7.5
        } else {
            return 15
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //MARK:生成每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UAddAttrGroupCell.self)
            cell.addGroup = { (name) in
                if name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" {
                    showHUDInView(text: "规格组名称不能为空", inView: self.view)
                    return
                }
                var group = Group()
                group.groupName = name
                self.attrData.group.append(group)

                tableView.reloadData()
            }
            return cell
        } else if (indexPath.section <= attrData.group.count) {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UAttrGroupCell.self)
            
            cell.groupArray = attrData.group[indexPath.section - 1].attr
            cell.groupName = attrData.group[indexPath.section - 1].groupName
            cell.deleteGroup = {
                self.attrData.group.remove(at: indexPath.section - 1)
                self.attrValue.attrValueArray.removeAll()
                tableView.reloadData()
            }
            cell.deleteAttr = { (attrIndex) in
                self.attrData.group[indexPath.section - 1].attr.remove(at: attrIndex)
                self.attrValue.attrValueArray.removeAll()
                self.getAttrArry(arrayIndex: 0, str: "")
                tableView.reloadData()
            }
            cell.addAttr = {
                showAlert(title: "添加规格", block: { (alert) in
                    let tf = UITextField(frame: CGRect.init(x: 0, y: 0, width: 266, height: 44))
                    tf.placeholder = "请输入规格名称"
                    tf.textAlignment = .center
                    alert.customSubview = tf
                    alert.addButton("取消",backgroundColor: UIColor.white, textColor: UIColor.black) {}
                    alert.addButton("确定", backgroundColor: UIColor.white, textColor: UIColor.hex(hexString: "#1C98F6")){
                        if tf.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" {
                            showHUDInView(text: "规格名称不能为空", inView: self.view)
                            return
                        }
                        var a = AttrData()
                        a.attrName = tf.text ?? ""
                        self.attrData.group[indexPath.section - 1].attr.append(a)
                        
                        self.attrValue.attrValueArray.removeAll()
                        self.getAttrArry(arrayIndex: 0, str: "")
                        
                        tableView.reloadData()
                    }
                })
            }
            return cell
        } else if (indexPath.section == attrData.group.count+1) {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UBatchSetPriceInventoryCell.self)
            cell.setValue = {
                self.configAlert()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UAttrCell.self)
            cell.model = self.attrValue.attrValueArray[indexPath.row]
            cell.setInventory = { (text) in
                self.attrValue.attrValueArray[indexPath.row].inventory = text
                
            }
            cell.setPrice = { (text) in
                self.attrValue.attrValueArray[indexPath.row].price = text
            }
            cell.setItemNum = { (text) in
                 self.attrValue.attrValueArray[indexPath.row].goodsNumber = text
            }
            return cell
            
        }

    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil
    }
    
    //MARK:生成具体的每个规格
    func getAttrArry(arrayIndex:Int,str:String) {
        
        for (_,item) in attrData.group[arrayIndex].attr.enumerated() {
            let name = str == "" ? "\(item.attrName)" : "\(str)-\(item.attrName)"
            if arrayIndex+1 == attrData.group.count {
                var att = AttrValue()
                att.attrName = name
                attrValue.attrValueArray.append(att)//append进入列表中
                continue
            }
            self.getAttrArry(arrayIndex: arrayIndex+1, str: name)
        }
    }
 
    func configAlertView(){
        var alert:SCLAlertView? = nil
        let inputReplyTF = UITextView(frame: CGRect(x: 0, y: 0, width: 180, height: 35))
        
        let style = SCLAlertView.SCLAppearance(
            kWindowWidth: 300, kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue", size: 18)!,
            showCloseButton: false,
            showCircularIcon: false,
            hideWhenBackgroundViewIsTapped:true,
            buttonsLayout: .horizontal
        )
        
        // Initialize SCLAlertView using custom Appearance
        alert = SCLAlertView(appearance: style)
        // Creat the subview
        alert?.viewWillAppear(true)
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 160))
        
        //回复输入框
        inputReplyTF.text = ""
        inputReplyTF.layer.borderColor = UIColor.hex(hexString: "#E5E5E5").cgColor
        inputReplyTF.layer.borderWidth = 1
        inputReplyTF.layer.cornerRadius = 2
        subview.addSubview(inputReplyTF)
        inputReplyTF.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.height.equalTo(160)
            ConstraintMaker.width.equalToSuperview().inset(15)
            ConstraintMaker.top.equalToSuperview()
        })
        
        alert?.addButton("取消", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#1C98F6")){}
        alert?.addButton("确定", backgroundColor: UIColor.white,textColor:UIColor.hex(hexString: "#07D781")){
            //TODO 批量设置
        }
        
        alert?.customSubview = subview
        
        alert?.showEdit("批量设置", subTitle: "",animationStyle:.noAnimation)
        
    }
    
    func configAlert(){
        //MARK:最外层布局
        let outerLayer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 138))
        //MARK:库存文本
        let inventory = UILabel(frame: CGRect(x: 0, y: 0, width: 31, height: 15))
        inventory.font = UIFont.systemFont(ofSize: 15)
        inventory.text = "库存"
        inventory.textColor = UIColor.hex(hexString: "#333333")
        //MARK:库存输入框
        let inventoryTF = UITextField()
        inventoryTF.placeholder = "请填写库存数量"
        inventoryTF.keyboardType = .numberPad
        //MARK:库存⤵️的🧵
        let inventoryLine = UIView()
        inventoryLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        //MARK:价格文本
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 15)
        price.text = "价格"
        price.textColor = UIColor.hex(hexString: "#333333")
        //MARK: ¥ 符号
        let money = UILabel()
        money.text = "¥ "
        money.font = UIFont.systemFont(ofSize: 15)
        money.textColor = UIColor.hex(hexString: "#333333")
        //MARK:价格输入框
        let priceTF = UITextField()
        priceTF.placeholder = "请填写价格"
        priceTF.keyboardType = .decimalPad
        priceTF.delegate = self
        //MARK:价格⤵️的🧵
        let priceLine = UIView()
        priceLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        //MARK:货号文本
        let goodsNumber = UILabel()
        goodsNumber.font = UIFont.systemFont(ofSize: 15)
        goodsNumber.text = "货号"
        goodsNumber.textColor = UIColor.hex(hexString: "#333333")
        //MARK:货号输入框
        let goodsNumberTF = UITextField()
        goodsNumberTF.placeholder = "请填写商品货号"
        goodsNumberTF.keyboardType = .numberPad
        //MARK:货号⤵️的🧵
        let goodsNumberLine = UIView()
        goodsNumberLine.backgroundColor = UIColor.hex(hexString: "#E5E5E5")
        //MARK:库存
        outerLayer.addSubview(inventory)
        inventory.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalToSuperview().offset(10)
            ConstraintMaker.width.equalTo(40)
            ConstraintMaker.height.equalTo(40)
        }
        //MARK:库存下面的线
        outerLayer.addSubview(inventoryLine)
        inventoryLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-5)
            ConstraintMaker.top.equalTo(inventory.snp.bottom)
            ConstraintMaker.height.equalTo(0.5)
        }
        //MARK:价格
        outerLayer.addSubview(price)
        price.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.width.equalTo(40)
            ConstraintMaker.top.equalTo(inventoryLine.snp.bottom)
            ConstraintMaker.height.equalTo(40)
        }
        //MARK: ¥ 符号
        outerLayer.addSubview(money)
        money.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(price.snp.right)
            ConstraintMaker.centerY.equalTo(price)
        }
        //MARK:价格下面的线
        outerLayer.addSubview(priceLine)
        priceLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-5)
            ConstraintMaker.top.equalTo(price.snp.bottom)
            ConstraintMaker.height.equalTo(0.5)
        }
        //MARK:货号
        outerLayer.addSubview(goodsNumber)
        goodsNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.width.equalTo(40)
            ConstraintMaker.top.equalTo(priceLine.snp.bottom)
            ConstraintMaker.height.equalTo(40)
        }
        //MARK:货号下面的线
        outerLayer.addSubview(goodsNumberLine)
        goodsNumberLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-5)
            ConstraintMaker.top.equalTo(goodsNumber.snp.bottom)
            ConstraintMaker.height.equalTo(0.5)
        }
        //MARK:库存输入框
        outerLayer.addSubview(inventoryTF)
        inventoryTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(inventory.snp.right)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.centerY.equalTo(inventory)
        }
        //MARK:价格输入框
        outerLayer.addSubview(priceTF)
        priceTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(money.snp.right)
            ConstraintMaker.centerY.equalTo(price)
        }
        //MARK:货号输入框
        outerLayer.addSubview(goodsNumberTF)
        goodsNumberTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsNumber.snp.right)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.centerY.equalTo(goodsNumber)
        }
        
        showAlert(title: "批量设置价格及库存", block: { (alert) in
            
            alert.customSubview = outerLayer
            alert.addButton("取消",backgroundColor: UIColor.white, textColor: UIColor.black) {}
            alert.addButton("确定", backgroundColor: UIColor.white, textColor: UIColor.hex(hexString: "#1C98F6")){
                for (i,_) in self.attrValue.attrValueArray.enumerated() {
                    self.attrValue.attrValueArray[i].goodsNumber = goodsNumberTF.text ?? "0"
                    self.attrValue.attrValueArray[i].inventory = inventoryTF.text ?? "0"
                    self.attrValue.attrValueArray[i].price = priceTF.text ?? "0.0"
                }
                self.tableView.reloadData()
            }
        })
            
    }
}

extension UChooseAttrController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.contains(".") {
            if textField.text?.count == 0 || textField.text!.contains(".") {
                return false
            }
        }
        return true
    }
}
