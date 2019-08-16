//
//  SetAttrDataModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//设置规格的数据源
class SetAttrDataModel {
    var group = [Group]()//最大只能三个
}
struct Group {
    var groupName = String()
    var attr = [AttrData]()//无上限
}
struct AttrData {
    var attrName = String()
}

