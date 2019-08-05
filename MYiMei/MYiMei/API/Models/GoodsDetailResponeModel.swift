//
//  GoodsDetailResponeModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:商品列表返回的Json数据
class GoodsDetailResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: GoodsDataModel?

}

// MARK:商品列表返回Data对象
class GoodsDataModel: Codable {
    var goods: GoodsDetail?
}

// MARK:返回商品对象
class GoodsDetail: Codable {
    var goods_id: Int?

    var goods_name: String?

    var price: String?

    var original_price: String?

    var detail: String?

    var goods_cat_id:Int?

    var service:String?

    var virtual_sales:Int?

    var cover_pic:String?

    var goods_pic:[String]?

    var video_url:String?

    var unit:String?

    var weight = Int()

    var goods_num = Int()

    var use_attr:Int?

    var full_cut:FullCutModel?

    var pt_cat_id:Int?

}

// MARK:商品列表返回Data对象
class FullCutModel: Codable {
    var pieces: String?
    var forehead: String?
}

