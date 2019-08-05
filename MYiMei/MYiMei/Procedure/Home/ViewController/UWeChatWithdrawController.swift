//
//  UWeChatWithdrawController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/30.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UWeChatWithdrawController: UBaseViewController {
    
    fileprivate var service = APIStoreServices()
    
    let mWeChatWithdrawView = UWeChatWithdrawView()
    
    var maxAmount:Double = 0.00
    
    override func configUI() {
        mWeChatWithdrawView.setView()
        self.view.addSubview(mWeChatWithdrawView)
        self.view.backgroundColor = UIColor.white
        mWeChatWithdrawView.withdrawalBtn.addTarget(self, action: #selector(submitCashOut), for: UIControl.Event.touchUpInside)
        mWeChatWithdrawView.cashWithdrawalAmountNUmberLaber.text = "¥\(maxAmount)"
        
        mWeChatWithdrawView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    //微信提现接口
    @objc func submitCashOut() {
        let cashOutMoney = Double(mWeChatWithdrawView.withdrawalAmountNumberEdit.text ?? "0.0")!
        if cashOutMoney > maxAmount {
            showHUDInView(text: "余额不足", inView: self.view)
            return
        }
        let cashOutType = 1 //微信线下打款
        let typeData = ApplyCashOutTypeDataModel()
        typeData.account = mWeChatWithdrawView.weChatNumberEdit.text ?? ""
        typeData.nickname = mWeChatWithdrawView.weChatNameLaber.text ?? ""
        
        service.applyCashOut(money: cashOutMoney, type: cashOutType, typeData: typeData, { (UploadFileResponeModel) in
            showHUDInView(text: UploadFileResponeModel.msg ?? "", inView: self.view)
            self.pressBack()
        }) { (APIErrorModel) in
            
        }
    }
    
}
