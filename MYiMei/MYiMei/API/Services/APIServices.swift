//
//  APIServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import MBProgressHUD

let ssl: Bool = true
//MARK:开发环境
 let baseHttpsUrl: String = "https://testjiajuapi.ifhu.cn"
 let baseHttpUrl: String = "http://testjiajuapi.ifhu.cn"
//MARK:正式环境
//let baseHttpsUrl: String = "https://jiajuapi.ifhu.cn"
//let baseHttpUrl: String = "http://jiajuapi.ifhu.cn"

// MARK: 网络请求加载插件
let loadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        MBProgressHUD.hide(for: vc.view, animated: false)
        MBProgressHUD.showAdded(to: vc.view, animated: true)
    case .ended:
        MBProgressHUD.hide(for: vc.view, animated: true)
    }
}

//MARK: 超时插件
let TimeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<NetApi>.RequestResultClosure) -> Void in

    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

//MARK: 接口函数
enum NetApi {
    case uploadPic(param: [String:Any])
    case login(user: [String:String])
    case getLoginMsg(user: [String:String])
    case logout(userId: String)
    case getCategory(param: [String:String])
    case getGoodsList(param: [String:String])
    case deleteGoods(param: [String:String])
    case modifyGoodsStatus(param: [String:String])
    case getDepositAgreement(param: [String:Any])
    case getOrderList(param: [String:Any])
    case getChangePasswordVerificationCode(param: [String:Any])
    case modifyPwd(param: [String:Any])
    case getMchCommonCatId(param: [String:Any])
    case applyJoin(param: [String:Any])
    case storeInfo(param: [String:Any])
    case getStoreOperateData(param: [String:Any])
    case modifyOrderPrice(param: [String:Any])
    case deliveryGoods(param: [String:Any])
    case modifyStoreInfo(param: [String:Any])
    case getStoreDepostData(param: [String:Any])
    case pushDepost(param:[String:Any])
    case addGoodsCat(param:[String:String])
    case deleteGoodsCat(param:[String:String])
    case editGoodsCat(param:[String:Any])
    case addGoods(param:[String:Any])
    case getMchPtCats(param: [String:Any])
    case getExpressList(param: [String:Any])
    case getOrderDetail(param: [String:Any])
    case getMessageNotice(param: [String:Any])
    case setMessageNoticeRead(param: [String:Any])
    case getGoodsDetail(param: [String:Any])
    case getCommentList(param: [String:Any])
    case delOrHideComment(param: [String:Any])
    case replyComment(param: [String:Any])
    case getRefundOrder(param: [String:Any])
    case handleRefundOrder(param: [String:Any])
    case incomeDetail(param: [String:Any])
    case cashOutRecord(param: [String:Any])
    case applyCashOut(param: [String:Any])
}

//MARK: 请求对象的封装
extension NetApi: TargetType {
    var baseURL: URL {
        if ssl {
            return URL(string: baseHttpsUrl)!
        }
        else {
            return URL(string: baseHttpUrl)!
        }
    }

    var path: String {
        switch self {
        case .login:
            return "/login"
        case .getLoginMsg:
            return "/get_captcha_login"
        case .logout(let userId):
            return "/tokens/" + userId + "/"
        case .getCategory:
            return "/list_cats"
        case .getGoodsList:
            return "/list_goods"
        case .deleteGoods:
            return "/delete_goods"
        case .modifyGoodsStatus:
            return "/modify_goods_status"
        case .getChangePasswordVerificationCode:
            return "/get_captcha_modify_pwd"
        case .modifyPwd:
            return "/modify_pwd"
        case .uploadPic:
            return "/upload_pic"
        case .getDepositAgreement:
            return "/mch_deposit/agreement"
        case .getOrderList:
            return "/list_order"
        case .applyJoin:
            return "/mch_apply"
        case .getMchCommonCatId:
            return "/apply_cat"
        case .storeInfo:
            return "/store_info"
        case .getStoreOperateData:
            return "/store_operate_data"
        case .modifyOrderPrice:
            return "/modify_price"
        case .deliveryGoods:
            return "/delivery_goods"
        case .modifyStoreInfo:
            return "/modify_store_info"
        case .getStoreDepostData:
            return "/mch_deposit/depositlist"
        case .pushDepost:
            return "/mch_deposit/create"
        case .addGoodsCat:
            return "/add_goods_cat"
        case .deleteGoodsCat:
            return "/delete_goods_cat"
        case .editGoodsCat:
            return "/modify_goods_cat"
        case .addGoods:
            return "/add_goods"
        case .getMchPtCats:
            return "/mch_pt_cats"
        case .getExpressList:
            return "/list_express"
        case .getOrderDetail:
            return "/get_order_detail"
        case .getMessageNotice:
            return "/message_notice/orderNotice"
        case .setMessageNoticeRead:
            return "/message_notice/readNotice"
        case .getGoodsDetail:
            return "/goods_detail"
        case .getCommentList:
            return "/comment_list"
        case .delOrHideComment:
            return "/comment_hod"
        case .replyComment:
            return "/comment_reply"
        case .getRefundOrder:
            return "/list_refund_order"
        case .handleRefundOrder:
            return "/refund_handle"
        case .incomeDetail:
            return "/income_detail"
        case .cashOutRecord:
            return "/cash_out_record"
        case .applyCashOut:
            return "/apply_cash_out"
        }
    }

    var method: Moya.Method {
        switch self {
        case .applyCashOut,.cashOutRecord,.incomeDetail,.handleRefundOrder,.getRefundOrder,.replyComment,.delOrHideComment,.getCommentList,.setMessageNoticeRead,.getMessageNotice,.getOrderDetail,.getExpressList,.getMchPtCats,.addGoods,.modifyStoreInfo,.storeInfo,.pushDepost,.getDepositAgreement,.getOrderList,.getStoreOperateData,.getMchCommonCatId,.applyJoin,.uploadPic,.login,.logout,.getCategory,.getLoginMsg,.getGoodsList,.deleteGoods,.modifyGoodsStatus,.getChangePasswordVerificationCode,.modifyPwd,.modifyOrderPrice,.deliveryGoods,.getStoreDepostData,.addGoodsCat,.deleteGoodsCat,.editGoodsCat,.getGoodsDetail:
          return .post

        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getLoginMsg(let user):
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
        case .login(let user):
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
        case .getCategory(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .logout(let userId):
            return .requestParameters(parameters: ["userid":userId], encoding: JSONEncoding.default)
        case .getGoodsList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .deleteGoods(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .modifyGoodsStatus(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getChangePasswordVerificationCode(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .modifyPwd(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .uploadPic(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getDepositAgreement(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getOrderList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getMchCommonCatId(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .applyJoin(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .storeInfo(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getStoreOperateData(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .modifyOrderPrice(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .deliveryGoods(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .modifyStoreInfo(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getStoreDepostData(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .pushDepost(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .addGoodsCat(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .deleteGoodsCat(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .editGoodsCat(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .addGoods(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getMchPtCats(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getExpressList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getOrderDetail(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getMessageNotice(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .setMessageNoticeRead(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getGoodsDetail(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getCommentList(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .delOrHideComment(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .replyComment(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .getRefundOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .handleRefundOrder(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .incomeDetail(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .cashOutRecord(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        case .applyCashOut(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
       }
    }

    var headers: [String : String]? {
        var dict: [String:String] = [
            "Content-Type":"application/json"
        ]
        switch self {
        case .logout:
            let token: String = getToken() // 本地token
            dict["Authorization"] = token
        default:
            break
        }
        return dict
    }
}

class APIService {

    private init(needMBProgressHUD:Bool) {
        if (needMBProgressHUD) {
            let APIProvider = MoyaProvider<NetApi>(plugins: [loadingPlugin,NetworkLoggerPlugin(verbose: true, cURL: true)])
            apiProvider = APIProvider
        }else {
            let APIProvider = MoyaProvider<NetApi>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])
            apiProvider = APIProvider
        }
    }

    public static let shared: APIService = APIService(needMBProgressHUD: true)

    public static let sharedBackground: APIService = APIService(needMBProgressHUD: false)

    private var manager: SessionManager?

    fileprivate(set) var apiProvider: MoyaProvider<NetApi>!

    func request(_ target: NetApi, _ success: @escaping ((Data) -> ()), _ fail: @escaping ((APIErrorModel) -> ())) {
        apiProvider.request(target) { (result) in
            print("--------接口响应----------------")
            switch result {
            case let .success(moyaResponse):
                do {
                    print("--- \(moyaResponse) -----")
                    let anyData = try moyaResponse.mapJSON()
                    let data =  moyaResponse.data
                    let statusCode =  moyaResponse.statusCode
                    if statusCode == 200 {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("code") {
                                if let code = mapData["code"] as? Int {
                                    if code == 0 {
                                        success(data)
                                    }else if code == 10000 {//token过期
                                        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                                    }
                                    else {
                                        let msg: String = mapData["msg"] as? String ?? "Error message"
                                        let errorModel = APIErrorModel.getErrorModel(_code: code, _msg: msg, _data: nil)
                                        fail(errorModel)
                                    }
                                }
                                else {
                                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: "Data not contain code", _data: nil)
                                    fail(errorModel)
                                }
                            }else {
                                let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: "Data not contain code", _data: nil)
                                fail(errorModel)
                            }
                        }
                        else {
                            let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: String(moyaResponse.description), _data: nil)
                            fail(errorModel)
                        }
                    }else if statusCode == 401 {//token过期
//                        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                    }else {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("msg") {
                                if let message = mapData["msg"] as? String {
                                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: message, _data: nil)
                                    fail(errorModel)
                                }
                            }

                        }else{
                            let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: String(moyaResponse.description), _data: nil)
                            fail(errorModel)
                        }
                    }

                } catch {
                    print(error.localizedDescription)
                    let errorModel = APIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _msg: nil, _data: error.localizedDescription)
                    fail(errorModel)
                }

            case let .failure(error):
                print(error.localizedDescription)
                let errorModel = APIErrorModel.getErrorModel(_code: nil, _msg: nil, _data: error.failureReason)
                fail(errorModel)
            }
            print("----------响应结束--------------")
        }
    }
}
