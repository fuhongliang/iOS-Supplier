//
//  APICommentServices.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APICommentServicesProtocol {
    //MARK:获取评价列表
    func getCommentList(type:Int,page:Int,_ success: @escaping(((CommentsResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:删除或隐藏 delOrhide  0-不隐藏  1-隐藏   delete 1-删除
    func delOrHideComment(commentId: String, delOrhide: Int, delete:Int,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:回复评价
    func replyComment(commentId: String, replyContent: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
}

class APICommentServices: APICommentServicesProtocol {
    
    func getCommentList(type:Int,page: Int, _ success: @escaping (((CommentsResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "type":type,
            "limit":10,
            "page":page
        ]
        
        APIService.shared.request(.getCommentList(param: params), { (data) in
            do{
                let model = try JSONDecoder().decode(CommentsResponseModel.self, from: data)
                success(model)
            } catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败\(error)", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
    func delOrHideComment(commentId: String, delOrhide: Int, delete: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "id":commentId,
            "hide":delOrhide,
            "delete":delete
        ]
        
        APIService.shared.request(.delOrHideComment(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func replyComment(commentId: String, replyContent: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "id":commentId,
            "content":replyContent
        ]
        
        APIService.shared.request(.replyComment(param: params), { (data) in
            print(data)
            success()
        }) { (error) in
            fail(error)
        }
    }
}
