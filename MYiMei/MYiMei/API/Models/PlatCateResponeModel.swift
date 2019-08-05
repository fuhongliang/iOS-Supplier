//
//  PlatCateResponeModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/12.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:平台分类列表返回的Json数据
class PlatCateResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: PlatCateResponeDataModel?

}

// MARK:平台分类列表返回Data对象
class PlatCateResponeDataModel: Codable {
    var pt_cats: [PlatCateModel]?
}

// MARK:返回平台分类对象
class PlatCateModel: Codable {
    var id: Int?

    var store_id: Int?

    var parent_id: Int?

    var name: String?

    var pic_url: String?

    var sort: Int?

    var is_delete: Int?

    var addtime: Int?

    var big_pic_url: String?

    var advert_pic: String?

    var advert_url: String?

    var is_show: Int?
}
