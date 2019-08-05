//
//  UDepositAgreementController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UDepositAgreementViewDelegate: AnyObject {
    func agree()
}

class UDepositAgreementController: UBaseViewController {
    
    fileprivate let service = APIDepositServices()
    
    let depositAgreementView = UDepositAgreementView()

    var agreementContent = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
    }
    
    override func configUI() {
        depositAgreementView.configUI()
        depositAgreementView.delegate = self
        self.view.addSubview(depositAgreementView)
        depositAgreementView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    //MARK:请求保证金协议
    func loadUrl() {
        service.getDepositAgreement({ (DepositAgreementResponsModel) in
            self.title = DepositAgreementResponsModel.data?.title
            self.agreementContent = DepositAgreementResponsModel.data?.content ?? "暂无保证金协议"
            self.depositAgreementView.wkWebView.loadHTMLString(self.agreementContent, baseURL: URL(string:"http://yiwuyimei-test.oss-cn-beijing.aliyuncs.com"))

        }) { (APIErrorModel) in
            showHUDInView(text: APIErrorModel.msg ?? "获取保证金协议失败", inView: self.view)
        }
    }
}

extension UDepositAgreementController: UDepositAgreementViewDelegate {
    //MARK:申请入驻
    func agree() {
        if (!depositAgreementView.checkButton.isSelected) {
            showHUDInView(text: "请勾选我已阅读并同意保证金协议", inView: view)
        } else {
            let vc = UDepostPostController()
            vc.title = "缴纳保证金"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

