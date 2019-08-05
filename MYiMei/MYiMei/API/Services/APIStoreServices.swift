//
//  APIStoreServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
protocol APIStoreServicesProtocol {

    //MARK:获取商铺经营数据
    func getStoreOperateData(_ success: @escaping(((StoreDashBoardModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //MARK:获取商铺保证金
    func getStoreDepostData(_ success: @escaping(((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //MARK:提交保证金
    func pushDepost(image_url: String,price: String, _ success: @escaping(((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:提现记录
    func cashOutRecord(page: Int, _ success: @escaping(((CashOutRecordResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:收支明细
    func incomeDetail(page: Int, _ success: @escaping(((IncomeDetailResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:提现申请
    func applyCashOut(money:Double, type:Int, typeData: ApplyCashOutTypeDataModel, _ success: @escaping(((UploadFileResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

}

class APIStoreServices: APIStoreServicesProtocol {
    
    func applyCashOut(money: Double, type: Int, typeData: ApplyCashOutTypeDataModel, _ success: @escaping (((UploadFileResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "money":money,
            "type":type,
            "type_data":["account":typeData.account,"bank_name":typeData.bank_name,"nickname":typeData.nickname]
        ]
        
        APIService.shared.request(.applyCashOut(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(UploadFileResponeModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败---\(error)", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
    //MARK:收支明细
    func incomeDetail(page: Int, _ success: @escaping (((IncomeDetailResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "limit":20,
            "page":page
        ]
        
        APIService.shared.request(.incomeDetail(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(IncomeDetailResponseModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败---\(error)", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
    //MARK:提现记录
    func cashOutRecord(page: Int, _ success: @escaping (((CashOutRecordResponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1",
            "limit":20,
            "page":page
        ]
        
        APIService.shared.request(.cashOutRecord(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(CashOutRecordResponseModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: "解析失败---\(error)", _data: nil)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
    
    //MARK:提交保证金
    func pushDepost(image_url: String, price: String, _ success: @escaping (((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "store_id":APIUser.shared.user?.store_id ?? "0",
            "is_debug":"1",
            "price":price,
            "image_url":image_url
        ]
        
        APIService.shared.request(.pushDepost(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(StoreDepostReponseModel.self, from: data)
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

    //MARK:获取商铺保证金
    func getStoreDepostData(_ success: @escaping (((StoreDepostReponseModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"]
        APIService.sharedBackground.request(.getStoreDepostData(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(StoreDepostReponseModel.self, from: data)
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

    //MARK:获取商铺经营数据
    func getStoreOperateData(_ success: @escaping (((StoreDashBoardModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"]
            APIService.sharedBackground.request(.getStoreOperateData(param: params), { (data) in
                do {
                    let model = try JSONDecoder().decode(StoreDashBoardModel.self, from: data)
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
