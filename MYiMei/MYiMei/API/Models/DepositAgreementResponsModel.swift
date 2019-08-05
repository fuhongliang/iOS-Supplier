//
//  DepositAgreementResponsModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

// MARK:保证金协议
class DepositAgreementResponsModel: Codable {
    var code: Int?
    
    var msg: String?
    
    var data: DepositAgreementResponsDataModel?
    
}

//MARK:保证金协议的data对象
class DepositAgreementResponsDataModel: Codable {
    var title: String?
    var content: String?
}


