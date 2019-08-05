//
//  StoreInfoModel.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation


//MARK:获取店铺信息返回的Json数据
class StoreInfoModel: Codable {
    
    var code: Int?
    
    var msg: String?
    
    var data: StoreInfoDataModel!
    
}

// MARK:获取店铺信息返回Data对象
class StoreInfoDataModel: Codable {
    var mch: MchModel?
}

// MARK:获取店铺信息返回商品对象
class MchModel: Codable {
    var name: String!
    
    var cat_name: String!
    
    var logo: String!
    
    var province_id: Int?
    
    var city_id: Int?
    
    var district_id: Int?
    
    var realname: String!
    
    var tel: String!
    
    var service_tel: String!
    
    var header_bg: String!
    
    var address: String!
    
    var region: String!
    
}
