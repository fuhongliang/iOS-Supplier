//
//  ExpressListResponesModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/13.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:物流公司列表返回的Json数据
class ExpressListResponesModel: Codable {
    
    var code: Int?
    
    var msg: String?
    
    var data: ExpressListModel?
    
}

// MARK:物流公司列表返回Data对象
class ExpressListModel: Codable {
    var express: [ExpressModel]?
}

// MARK:返回物流公司的model
class ExpressModel: Codable {
    var id: Int?
    
    var name: String?
    
    var code: String?
    
    var sort: Int?
    
    var type: String?
    
    var is_delete: Int?
}
