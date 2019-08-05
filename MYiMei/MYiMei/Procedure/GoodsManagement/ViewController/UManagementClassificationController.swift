//
//  UManagementClassificationController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UManagementClassificationController: UBaseViewController {
    
    var categoryList = [CategoryModel]()
    
    fileprivate var service = APIGoodsServices()
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tw.delegate = self
        tw.dataSource = self
        tw.register(cellType: UManagementClassificationCell.self)
        tw.separatorColor = UIColor.clear
        //
        return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCategoryInfo()
    }
    
    override func configUI() {
        self.view.addSubview(tableView)
//        self.view.backgroundColor = UIColor.white
        tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        getCategoryInfo()
    }
    
    func getCategoryInfo() {
        service.getCategory(mch_id: APIUser.shared.user?.mch_id ?? 0, access_token: APIUser.shared.user?.access_token ?? "", { (CategoryResponeModel) in
            self.categoryList = CategoryResponeModel.data?.cats ?? []
            self.tableView.reloadData()
        }) { (APIErrorModel) in
            
        }
    }
}

extension UManagementClassificationController: UITableViewDelegate,UITableViewDataSource {
    
    //MARK:cell组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    //MARK:cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    //MARK:每组cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    //MARK:点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
   
    //MARK:返回每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell待更换
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UManagementClassificationCell.self)
        cell.editCategory = {
            let vc = UClassEditController()
            vc.title = "编辑分类"
            vc.isNewCategory = false
            vc.categoryId = self.categoryList[indexPath.section].id ?? 0
            vc.categoryName = self.categoryList[indexPath.section].name ?? ""
            vc.categorySort = self.categoryList[indexPath.section].sort ?? -1
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.deleteCategory = {
            self.showAlertControllerStyle(title: "温馨提示", message: "删除该分类将会删除分类下所有商品", categoryId: self.categoryList[indexPath.section].id ?? 0)
        }
        
        cell.model = categoryList[indexPath.section]
        
        return cell
        
    }
    
    //MARK: 提示框
    func showAlertControllerStyle(title:String , message:String,categoryId:Int) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action: UIAlertAction!) -> Void in
            self.deleteCategory(categoryId: categoryId)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteCategory(categoryId:Int) {
        self.service.deleteGoodsCat(catId: String(categoryId), { () in
            showHUDInView(text: "删除成功", inView: self.view)
            self.getCategoryInfo()
        }, { (APIErrorModel) in
            showHUDInView(text: "删除失败", inView: self.view)
        })
    }
    
  
}
