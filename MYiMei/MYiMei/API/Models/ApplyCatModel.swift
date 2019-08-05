//
//  ApplyCatModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:分类列表返回的Json数据
class ApplyCatModel: Codable {

    var code: Int?

    var msg: String?

    var data: [CatModel]?

}

// MARK:返回分类对象
class CatModel: Codable {
    var id =  Int()

    var name: String?
}
