//
//  CategoryModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:分类列表返回的Json数据
class CategoryResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: CategoryResponeDataModel?

}

// MARK:分类列表返回Data对象
class CategoryResponeDataModel: Codable {
    var cats: [CategoryModel]?
}

// MARK:返回分类对象
class CategoryModel: Codable {
    var id: Int?

    var parent_id: Int?

    var mch_id: Int?

    var name: String?

    var icon: String?

    var sort: Int?

    var is_delete: Int?

    var addtime: Int?

}
