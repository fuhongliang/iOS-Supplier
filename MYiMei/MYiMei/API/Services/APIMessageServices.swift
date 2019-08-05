//
//  APIMessageServices.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIMessageServicesProtocol {
    
    //MARK:获取消息提醒的列表
    func getOrderMessageNotice(page: Int, _ success: @escaping(((MessageNoticeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:设置消息已读
    func setOrderMessageReaded(messageId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
}

class APIMessageServices: APIMessageServicesProtocol {
    
    func setOrderMessageReaded(messageId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "id":messageId,
            "is_debug":"1"
        ]
        
        APIService.shared.request(.getMessageNotice(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    
    func getOrderMessageNotice(page: Int, _ success: @escaping (((MessageNoticeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id": APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "limit":5,
            "page":page,
            "is_debug":"1"
        ]
        
        APIService.shared.request(.getMessageNotice(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(MessageNoticeModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
}

