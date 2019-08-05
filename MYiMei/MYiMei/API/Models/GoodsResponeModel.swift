//
//  GoodsResponeModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:商品列表返回的Json数据
class GoodsResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: GoodsResponeDataModel?

}

// MARK:商品列表返回Data对象
class GoodsResponeDataModel: Codable {
    var goods: [GoodsModel]?
}

// MARK:返回商品对象
class GoodsModel: Codable {
    var goods_id: Int?

    var cover_pic: String?

    var name: String?

    var price: String?

    var original_price: String?

    var goods_num: Int?

    var status:Int?

}
