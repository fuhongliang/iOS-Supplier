//
//  UGoodsDescrView.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import RichEditorView

class UGoodsDescrView: BaseView {

    //MARK:编辑框
    var editorView = RichEditorView()

    func configUI(){
        self.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        self.addSubview(editorView)
        editorView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.left.right.equalToSuperview()
            ConstraintMaker.bottom.equalToSuperview()
        }
    }
}
