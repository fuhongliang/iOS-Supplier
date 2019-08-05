//
//  UClassEditController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/6.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UClassEditController: UBaseViewController {
    
    fileprivate var service = APIGoodsServices()
    
    let classEditView = UClassEditView()
    
    var title：String = "新建分类"
    
    var isNewCategory = true
    var categoryId:Int = 0
    var categoryName:String = ""
    var categorySort:Int = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classEditView.configUI()
        classEditView.delegate = self
        self.view.addSubview(classEditView)
        classEditView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        if (!isNewCategory){
            classEditView.classNameTF.text = categoryName
            classEditView.classSortTF.text = String(categorySort)
        }
        
    }
    
    func submitCatInfo(catName:String,catSort:String) {
        if catName == "" {
            showHUDInView(text: "请输入分类名称", inView: view)
        } else {
            if (!isNewCategory) {
                
                service.editGoodsCat(catId: categoryId, name: classEditView.classNameTF.text ?? categoryName, sort: Int(classEditView.classSortTF.text ?? String(categorySort))! , {
                    showHUDInView(text: "修改成功", inView: self.view)
                    self.pressBack()
                }) { (APIErrorModel) in
                    showHUDInView(text: "修改失败", inView: self.view)
                    self.pressBack()
                }
            } else {
                service.addGoodsCat(name: catName, sort: catSort, {
                    showHUDInView(text: "添加分类成功", inView: self.view)
                    self.pressBack()
                }) { (APIErrorModel) in
                    
                }
            }
        }
    }
    
}

extension UClassEditController: UClassEditViewDelegate {
    
    func tapSubmitAction(name: String, sort: String) {
        self.submitCatInfo(catName: name, catSort: sort)
    }
    
    
}

