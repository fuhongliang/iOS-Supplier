//
//  CashOutRecordResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//提现记录Model
class CashOutRecordResponseModel: Codable {
    var code = Int()
    var msg = String()
    var data : CashOutRecordListModel!
}

class CashOutRecordListModel: Codable {
    var cash : [CashOutRecordModel]!
}

class CashOutRecordModel: Codable {
    var id = Int()
    var money = String()
    var status = Int()
    var addtime = Int()
}

