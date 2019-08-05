//
//  MessageNoticeModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//MARK:订单列表返回的Json数据
class MessageNoticeModel: Codable {
    
    var code : Int!
    var data : MessageListModel!
    var msg : String!
    
}

//MARK:返回的订单列表
class MessageListModel: Codable{
    
    var msg : [MessageInfo]!
    
}

class MessageInfo: Codable{
    
    var addtime : Int!
    var msg_type : String!
    var msg_content : String!
    
    
    
}
