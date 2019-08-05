//
//  MchApplyResponeModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/10.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:店铺设置返回的Json数据
class MchApplyResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: MchApplyResponeDataModel?

}

//MARK:返回的店铺data对象
class MchApplyResponeDataModel: Codable {
    var apply_info: ApplyInfoModel?
    var apply_result: ApplyResultModel?
}



class ApplyInfoModel: Codable {
    var address: String?

    var city: String?

    var district: String?

    var header_bg: String?

    var latitude: String?

    var logo: String?

    var longitude: String?

    var mch_common_cat_id: String?

    var name: String?

    var password: String?

    var province: String?

    var realname: String?

    var service_tel: String?

    var tel: String?

    var username: String?

    var access_token: String?

    var business_license: String?

    var is_debug: String?

    var mch_id: String?
}

class ApplyResultModel: Codable {
    var apply_status: Int?

    var apply_result: String?

}
