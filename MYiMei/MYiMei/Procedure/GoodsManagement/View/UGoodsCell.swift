//
//  UGoodsCell.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/26.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
import Kingfisher

class UGoodsCell: UBaseTableViewCell {
    var subscribeGoodsPopupAction : (() -> ())?
    var subscribeGoodsEditAction : (() -> ())?
    var subscribeGoodsDeleteAction : (() -> ())?

    //商品名称
    var goodsTitleLabel = UILabel()
    //商品价格
    var goodsPriceLabel = UILabel()
    //商品库存
    var goodsAmountLabel = UILabel()
    //商品图片
    var goodsImageView = UIImageView()
    //商品状态
    var goodsStatusLabel = UILabel()

    //商品上下架按钮
    var goodsPopupBtn = UIButton()
    //商品编辑按钮
    var goodsEditBtn = UIButton()
    //商品删除按钮
    var goodsDeleteBtn = UIButton()

    override func configUI() {
        self.backgroundColor = UIColor.white
        goodsImageView.backgroundColor = UIColor.gray
        self.addSubview(goodsImageView)
        goodsImageView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.width.equalTo(76)
            ConstraintMaker.height.equalTo(76)
            ConstraintMaker.top.equalToSuperview().offset(15)
        }

        goodsStatusLabel.backgroundColor = UIColor.hex(hexString: "#F77A27")
        goodsStatusLabel.text = "已下架"
        goodsStatusLabel.textColor = UIColor.white
        goodsStatusLabel.font = UIFont.systemFont(ofSize: 12)
        goodsStatusLabel.textAlignment = .center
        self.addSubview(goodsStatusLabel)
        goodsStatusLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.width.equalTo(76)
            ConstraintMaker.height.equalTo(20)
            ConstraintMaker.bottom.equalTo(goodsImageView.snp.bottom)
        }

        goodsTitleLabel.font = UIFont.systemFont(ofSize: 16)
        goodsTitleLabel.textColor = UIColor.black
        goodsTitleLabel.text = "实木沙发冬夏两用沙..."
        self.addSubview(goodsTitleLabel)
        goodsTitleLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsImageView.snp.right).offset(15)
            ConstraintMaker.top.equalToSuperview().offset(20)
            ConstraintMaker.right.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
        }

        goodsPriceLabel.font = UIFont.systemFont(ofSize: 18)
        goodsPriceLabel.textColor = UIColor.hex(hexString: "#FF4444")
        goodsPriceLabel.text = "￥3999.00"
        self.addSubview(goodsPriceLabel)
        goodsPriceLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsImageView.snp.right).offset(15)
            ConstraintMaker.top.equalTo(goodsTitleLabel.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(15)
        }

        goodsAmountLabel.font = UIFont.systemFont(ofSize: 12)
        goodsAmountLabel.textColor = UIColor.hex(hexString: "#666666")
        goodsAmountLabel.text = "当前库存:858"
        self.addSubview(goodsAmountLabel)
        goodsAmountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsImageView.snp.right).offset(15)
            ConstraintMaker.top.equalTo(goodsPriceLabel.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(15)
        }

        goodsPopupBtn.backgroundColor = UIColor.white
        goodsPopupBtn.layer.borderColor = UIColor.theme.cgColor
        goodsPopupBtn.layer.borderWidth = 1
        goodsPopupBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        goodsPopupBtn.setTitle("上下架", for: UIControl.State.normal)
        goodsPopupBtn.layer.masksToBounds = true
        goodsPopupBtn.layer.cornerRadius = 2
        goodsPopupBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(goodsPopupBtn)
        goodsPopupBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.width.equalTo(74)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.top.equalTo(goodsImageView.snp.bottom).offset(13)
        }

        goodsEditBtn.backgroundColor = UIColor.white
        goodsEditBtn.layer.borderColor = UIColor.theme.cgColor
        goodsEditBtn.layer.borderWidth = 1
        goodsEditBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        goodsEditBtn.setTitle("编辑", for: UIControl.State.normal)
        goodsEditBtn.layer.masksToBounds = true
        goodsEditBtn.layer.cornerRadius = 2
        goodsEditBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(goodsEditBtn)
        goodsEditBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsPopupBtn.snp.right).offset(12)
            ConstraintMaker.width.equalTo(74)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.top.equalTo(goodsPopupBtn.snp.top)
        }

        goodsDeleteBtn.backgroundColor = UIColor.white
        goodsDeleteBtn.layer.borderColor = UIColor.theme.cgColor
        goodsDeleteBtn.layer.borderWidth = 1
        goodsDeleteBtn.setTitleColor(UIColor.theme, for: UIControl.State.normal)
        goodsDeleteBtn.setTitle("删除", for: UIControl.State.normal)
        goodsDeleteBtn.layer.masksToBounds = true
        goodsDeleteBtn.layer.cornerRadius = 2
        goodsDeleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(goodsDeleteBtn)
        goodsDeleteBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsEditBtn.snp.right).offset(12)
            ConstraintMaker.width.equalTo(74)
            ConstraintMaker.height.equalTo(30)
            ConstraintMaker.top.equalTo(goodsEditBtn.snp.top)
        }

        goodsPopupBtn.addTarget(self, action: #selector(tapGoodsPopupAction), for: UIControl.Event.touchDown)
        goodsEditBtn.addTarget(self, action: #selector(tapGoodsEdittAction), for: UIControl.Event.touchDown)
        goodsDeleteBtn.addTarget(self, action: #selector(tapGoodsDeleteAction), for: UIControl.Event.touchDown)
    }

    @objc func tapGoodsPopupAction() {
        subscribeGoodsPopupAction?()
    }

    @objc func tapGoodsEdittAction() {
        subscribeGoodsEditAction?()
    }

    @objc func tapGoodsDeleteAction() {
        subscribeGoodsDeleteAction?()
    }


    var model: GoodsModel? {
        didSet {
            guard let model = model else { return }
            goodsTitleLabel.text = model.name
            goodsPriceLabel.text = model.price
            goodsAmountLabel.text = "当前库存" + String(model.goods_num!)
            let url = URL(string: model.cover_pic!)
            goodsImageView.kf.setImage(with: url)
            if(model.status == 0){
                self.addSubview(goodsStatusLabel)
                goodsStatusLabel.snp.makeConstraints { (ConstraintMaker) in
                    ConstraintMaker.left.equalToSuperview().offset(15)
                    ConstraintMaker.width.equalTo(76)
                    ConstraintMaker.height.equalTo(20)
                    ConstraintMaker.bottom.equalTo(goodsImageView.snp.bottom)
                }
            }else{
                goodsStatusLabel.removeFromSuperview()
            }
        }
    }
}
