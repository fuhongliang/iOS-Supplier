//  评论Model
//  CommentsResponseModel.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

//评论回来的model
class CommentsResponseModel: Codable {
    var code: Int!
    var msg: String!
    var data: CommentsListModel!
}

//评论列表model
class CommentsListModel: Codable {
    var comment: [CommentModel]!
}

//评论信息model
class CommentModel: Codable {
    var id = Int()
    var order_detail_id = Int()
    var score = String()
    var content = String()
    var pic_list : [String]!
    var is_hide = Int()
    var addtime = Int()
    var reply_content : String?
    var name = String()
    var avatar = String()
}
