//
//  APIHeadOfShareServices.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIHeadOfShareServiceProtocol {
    //MARK:获取团长列表
    func listShare(type:Int,page:Int,_ success: @escaping(((HeadOfShareResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:删除团长
    func delShare(shareId:Int,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    func addShare(shareId:Int,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

}

class APIHeadOfShareService: APIHeadOfShareServiceProtocol {
    func delShare(shareId: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.self.user?.mch_id as Any,
            "access_token":APIUser.shared.self.user?.access_token as Any,
            "is_debug":"1",
            "share_id":shareId
        ]
        APIService.shared.request(.delShare(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func addShare(shareId: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.self.user?.mch_id as Any,
            "access_token":APIUser.shared.self.user?.access_token as Any,
            "is_debug":"1",
            "share_id":shareId
        ]
        APIService.shared.request(.addShare(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func listShare(type: Int, page: Int, _ success: @escaping (((HeadOfShareResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.self.user?.mch_id as Any,
            "access_token":APIUser.shared.self.user?.access_token as Any,
            "is_debug":"1",
            "type":type,
            "page":page
        ]
        APIService.shared.request(.listShare(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(HeadOfShareResponseModel.self, from: data)
                success(model)
            }
            catch {
                print("解析失败\(error)")
            }
        }) { (error) in
            fail(error)
        }
    }
    
    
}
