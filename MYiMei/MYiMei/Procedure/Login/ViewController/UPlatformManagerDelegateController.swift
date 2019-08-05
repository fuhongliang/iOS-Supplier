//
//  UPlatformManagerDelegateController.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/8/3.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import WebKit

class UPlatformManagerDelegateController: UBaseViewController {
    
    let wkWebView = WKWebView()
    
    override func configUI() {
        
        view.addSubview(wkWebView)
        wkWebView.frame = view.bounds
        
        let bundlePath = Bundle.main.bundlePath
        let path = "file://\(bundlePath)/HTML_Files/protocol.html"
        guard let url = URL(string: path) else {
            return
        }
        let request = URLRequest(url: url)
        wkWebView.load(request)
        
    }

}
