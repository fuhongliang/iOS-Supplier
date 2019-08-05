//
//  UploadFileResponeModel.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
//MARK:商品列表返回的Json数据
class UploadFileResponeModel: Codable {

    var code: Int?

    var msg: String?

    var data: FileResponeDataModel?

}

// MARK:商品列表返回Data对象
class FileResponeDataModel: Codable {
    var url: String?
}
