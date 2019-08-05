//
//  APIGoodsServices.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation

protocol APIGoodsServicesProtocol {
    //MARK:添加商品分类
    func addGoodsCat(name: String, sort: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:删除商品分类
    func deleteGoodsCat(catId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:编辑商品分类
    func editGoodsCat(catId: Int,name: String, sort: Int, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //MARK:获取分类
    func getCategory(mch_id: Int, access_token: String, _ success: @escaping(((CategoryResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //获取商品列表协议
    func getGoodsList(mch_id: Int,cat_id: Int, access_token: String, _ success: @escaping(((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //删除商品
    func deleteGoods(mch_id: Int,goods_id: Int, access_token: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //上下架商品
    func modifyGoodsStatus(mch_id: Int,goods_id: Int,status: Int, access_token: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //发布商品
    func addGoods(name: String,
                  detail: String,cover_pic: String,goods_pic: [String],pt_cat_id: Int,goods_cat_id: Int,unit: String,weight: String,original_price: String,price: String,
                  pieces: String,forehead: String,service: String,goods_num: String,_ success: @escaping((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))
    
    //获取平台分类
    func getMchPtCats( _ success: @escaping(((PlatCateResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))

    //获取平台分类
    func getGoodsDetail(mch_id: Int,goods_id: Int, access_token: String, _ success: @escaping(((GoodsDetailResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void))


}

class APIGoodsServices: APIGoodsServicesProtocol {
    func getGoodsDetail(mch_id: Int, goods_id: Int, access_token: String, _ success: @escaping (((GoodsDetailResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":String(mch_id),
            "goods_id":String(goods_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.getGoodsDetail(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(GoodsDetailResponeModel.self, from: data)
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
    
    func editGoodsCat(catId: Int, name: String, sort: Int, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id ?? 0,
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "cat_id":catId,
            "name":name,
            "sort":sort,
            "is_debug":"1"
        ]
        APIService.shared.request(.editGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func deleteGoodsCat(catId: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(APIUser.shared.user?.mch_id ?? 0),
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "cat_id":catId,
            "is_debug":"1"
        ]
        APIService.shared.request(.deleteGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    func getMchPtCats(_ success: @escaping (((PlatCateResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"
        ]

        APIService.shared.request(.getMchPtCats(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(PlatCateResponeModel.self, from: data)
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
    
    func addGoodsCat(name: String, sort: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(APIUser.shared.user?.mch_id ?? 0),
            "access_token":String(APIUser.shared.user?.access_token ?? ""),
            "name":name,
            "sort":sort,
            "is_debug":"1"
        ]
        APIService.shared.request(.addGoodsCat(param: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }

    func addGoods(name: String, detail: String, cover_pic: String, goods_pic: [String], pt_cat_id: Int,goods_cat_id:Int, unit: String, weight: String, original_price: String, price: String, pieces: String, forehead: String, service: String, goods_num: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:Any] = [
            "mch_id":APIUser.shared.user?.mch_id as Any,
            "name":name,
            "detail":detail,
            "cover_pic":cover_pic,
            "goods_pic":goods_pic,
            "pt_cat_id":pt_cat_id,
            "goods_cat_id":goods_cat_id,
            "unit":unit,
            "weight":weight,
            "original_price":original_price,
            "price":price,
            "pieces":pieces,
            "forehead":forehead,
            "service":service,
            "goods_num":goods_num,
            "access_token":APIUser.shared.user?.access_token as Any,
            "is_debug":"1"
        ]

        APIService.shared.request(.addGoods(param: params), { (data) in
            do {
                success()
            }
        }) { (error) in
            fail(error)
        }
    }


    func modifyGoodsStatus(mch_id: Int, goods_id: Int, status: Int, access_token: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "goods_id":String(goods_id),
            "status":String(status),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.modifyGoodsStatus(param: params), { (data) in
            do {
                success()
            }
        }) { (error) in
            fail(error)
        }
    }

    func deleteGoods(mch_id: Int, goods_id: Int, access_token: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "goods_id":String(goods_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.deleteGoods(param: params), { (data) in
            do {
                success()
            }
        }) { (error) in
            fail(error)
        }

    }

    func getGoodsList(mch_id: Int, cat_id: Int, access_token: String, _ success: @escaping (((GoodsResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
             "cat_id":String(cat_id),
            "access_token":access_token,
            "is_debug":"1"
        ]

        APIService.shared.request(.getGoodsList(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(GoodsResponeModel.self, from: data)
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

    func getCategory(mch_id: Int, access_token: String, _ success: @escaping (((CategoryResponeModel) -> Void)), _ fail: @escaping ((APIErrorModel) -> Void)) {
        let params: [String:String] = [
            "mch_id":String(mch_id),
            "access_token":access_token,
            "is_debug":"1"
        ]
        APIService.shared.request(.getCategory(param: params), { (data) in
            do {
                let model = try JSONDecoder().decode(CategoryResponeModel.self, from: data)
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
