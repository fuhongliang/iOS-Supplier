//
//  UITextViewExtension.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/20.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import Foundation


var _dl_MaxLengthKey = "__dl_MaxLengthKey"

extension UITextView{
    var dl_maxLength:Int32 {
        get {
            return (objc_getAssociatedObject(self, &_dl_MaxLengthKey) as AnyObject).int32Value
        }
        set(dl_maxLength) {
            objc_setAssociatedObject(self, &_dl_MaxLengthKey, "\(dl_maxLength)", objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
            if dl_maxLength > 0 {
                self.addTarget(self, action: #selector(_dl_valueChanged(_:)), for: .allEditingEvents)
            } else {
                self.removeTarget(self, action: #selector(_dl_valueChanged(_:)), for: .allEditingEvents)
            }
        }
    }
    @objc fileprivate func _dl_valueChanged(_ textfiled:UITextField) {
        if self.dl_maxLength == 0 {
            return
        }
        let currentLength = Int32((textfiled.text?.count)!)
        if currentLength <= self.dl_maxLength {
            return
        }
        let index = textfiled.text!.index(textfiled.text!.startIndex, offsetBy: Int(self.dl_maxLength))
        let subString = textfiled.text?.substring(to: index)
        DispatchQueue.main.async {
            textfiled.text = subString
            textfiled.sendActions(for: .editingChanged)
        }
    }
}

