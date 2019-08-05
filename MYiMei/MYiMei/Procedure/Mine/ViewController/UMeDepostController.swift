//
//  UMeDepostController.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMeDepostController: UBaseViewController {
    
    let mMeDepostController = UMeDepost()

    
    override func configUI() {
        mMeDepostController.setView()
        self.view.addSubview(mMeDepostController)
        self.view.backgroundColor = UIColor.white
        
        if let url = getUrl(){
            mMeDepostController.webView.load(url)
        }
        
        mMeDepostController.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    //MARK:网络请求
    func getUrl() -> URLRequest? {
        
        if let url = URL(string:"http://www.baidu.com") {
            return URLRequest(url: url)
        }
        return nil
    }
}

