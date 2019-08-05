//
//  UBankCardWithdrawController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UBankCardWithdrawController: UBaseViewController {
    
    fileprivate var service = APIStoreServices()
    
    let mBankCardWithdrawView = UBankCardWithdrawView()
    
    var maxAmount:Double = 0.00
    
    override func configUI() {
        mBankCardWithdrawView.setView()
        self.view.addSubview(mBankCardWithdrawView)
        self.view.backgroundColor = UIColor.white
        mBankCardWithdrawView.withdrawalBtn.addTarget(self, action: #selector(submitCashOut), for: UIControl.Event.touchUpInside)
        mBankCardWithdrawView.cashWithdrawalAmountNUmberLaber.text = "¥\(maxAmount)"
//        mBankCardWithdrawView.withdrawalAmountNumberEdit.delegate = self
        
        mBankCardWithdrawView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
    }
    
    //银行卡提现接口
    @objc func submitCashOut() {
        let cashOutMoney = Double(mBankCardWithdrawView.withdrawalAmountNumberEdit.text ?? "0")!
        if cashOutMoney > maxAmount {
            showHUDInView(text: "余额不足", inView: self.view)
            return
        }
        let cashOutType = 3 //银行卡线下打款
        let typeData = ApplyCashOutTypeDataModel()
        typeData.account = mBankCardWithdrawView.bankNumberEdit.text ?? ""
        typeData.nickname = mBankCardWithdrawView.bankUserNameEdit.text ?? ""
        typeData.bank_name = mBankCardWithdrawView.bankNameInput.text ?? ""
        service.applyCashOut(money: cashOutMoney, type: cashOutType, typeData: typeData, { (UploadFileResponeModel) in
            showHUDInView(text: UploadFileResponeModel.msg ?? "", inView: self.view)
            self.pressBack()
        }) { (APIErrorModel) in
            
        }
    }
}

//extension UBankCardWithdrawController : UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        var newString = string//[textField.text stringByReplacingCharactersInRange:range withString:string];
//
//        //first, check if the new string is numeric only. If not, return NO;
////        let characterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789,."] invertedSet];
////        if ([newString rangeOfCharacterFromSet:characterSet].location != nil)
////        {
////            return false;
////        }
//
//        if (Double(newString) <= maxAmount) {
//            return true
//        }
//
//        return false;
//    }
//}
