//
//  HeadOfShareResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//团长列表Model
class HeadOfShareResponseModel : Codable {
    var code = Int()
    var msg = String()
    var data : HeadOfShareDataModel!
}

class HeadOfShareDataModel: Codable {
    var row_count = Int()//数据总条数
    var page_count = Int()//数据总页数
    var list : [HeadOfShareListModel]!
}

class HeadOfShareListModel : Codable {
    var name = String()
    var address = String()
    var id = Int()
    var avatar_url = String()
}
