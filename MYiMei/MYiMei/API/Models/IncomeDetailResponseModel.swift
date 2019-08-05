//
//  IncomeDetailResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/1.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//收支明细Model
class IncomeDetailResponseModel: Codable {
    var code = Int()
    var msg = String()
    var data : IncomeDetailListModel!
}

class IncomeDetailListModel: Codable {
    var accounts : [IncomeDetailModel]!
    var balance = String()
}

class IncomeDetailModel: Codable {
    var id = Int()
    var price = String()
    var type = Int()
    var desc = String()
    var addtime = Int()
}

