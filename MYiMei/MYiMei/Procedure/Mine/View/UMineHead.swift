//
//  UMineHead.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/25.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UMineHead: UIView {

    private lazy var bgView: UIImageView = {
        let bw = UIImageView()
        bw.contentMode = .scaleAspectFill
        return bw
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configUI() {
        addSubview(bgView)
        bgView.snp.makeConstraints {$0.edges.equalToSuperview() }
        sexTypeDidChange()
    }

    @objc func sexTypeDidChange() {
        bgView.image = UIColor.hex(hexString: "#1C98F6").image()
    }
}
