//
//  URefundOrderUntreatedCell.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/29.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class URefundOrderUntreatedCell: UBaseTableViewCell {
    
    var refusedDealWith : (() -> ())?
    var confirmDealWith : (() -> ())?
    var callTheClient : (() -> ())?
    
    //MARK:订单号&状态
    var orderNoLabel:UILabel = {
        let ul = UILabel()
        ul.text = "订单号:"
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    var orderStatus:UILabel = {
        let ul = UILabel()
        ul.text = "待处理"
        ul.textColor = UIColor.hex(hexString: "#FF8A17")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    
    //MARK:订单号下的线🧵
    var orderLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:联系人的灰色按钮
    var grayBgBtn:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        ub.layer.cornerRadius = 3
        ub.clipsToBounds = true
        return ub
    }()
    //联系人名字
    var userNameLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    //联系人电话
    var userPhoneLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.black
        ul.font = UIFont.boldSystemFont(ofSize: 14)
        return ul
    }()
    //电话图标
    var phoneIcon:UIImageView = {
        let uiv = UIImageView()
        uiv.image = UIImage.init(named: "phoneIcon")
        return uiv
    }()
    //联系收货人
    var contactLabel:UILabel = {
        let ul = UILabel()
        ul.text = "联系收货人"
        ul.textColor = UIColor.hex(hexString: "#1C98F6")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:商品信息
    //商品图片
    var goodsIcon:UIImageView = {
        let uiv = UIImageView()
        uiv.layer.cornerRadius = 2
        uiv.layer.masksToBounds = true
        return uiv
    }()
    //商品名称
    var goodsNameLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 15)
        return ul
    }()
    //商品规格
    var goodsSpecification:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    //商品价格
    var goodsPrice:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 14)
        return ul
    }()
    //商品数量
    var goodsNumber:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#999999")
        ul.font = UIFont.systemFont(ofSize: 12)
        return ul
    }()
    
    //MARK:商品信息下的线🧵
    var goodsLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:售后详情
    var afterSalesLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "售后类型:"
        return ul
    }()
    //具体的售后类型
    var afterSalesContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    //退款金额标题
    var refundMoneyLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "退款金额:"
        return ul
    }()
    //退款金额
    var refundMoneyContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#FF4444")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    //申请理由
    var refundCauseLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        ul.text = "申请理由:"
        return ul
    }()
    var refundCauseContentLabel:UILabel = {
        let ul = UILabel()
        ul.textColor = UIColor.hex(hexString: "#333333")
        ul.font = UIFont.systemFont(ofSize: 13)
        return ul
    }()
    
    //MARK:售后详情下的线🧵
    var refundLine:UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        return uv
    }()
    
    //MARK:申请退款时上传的图片
    var uploadPicOne:UIImageView = {
        let uiv = UIImageView()
        return uiv
    }()
    
    //横向滚动的TableView
//    var uploadPicTableView:UITableView = {
//        let tw = UITableView()
//        //把tableView逆向旋转90° cell也需要旋转90°
//        tw.transform = CGAffineTransform(rotationAngle: -.pi/2)
//        tw.backgroundColor = UIColor.background
//        tw.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
//        tw.separatorStyle = UITableViewCell.SeparatorStyle.none
//        tw.showsVerticalScrollIndicator = false
//        //TODO 暂未设置代理
//        tw.register(cellType: URefundOrderImageCell.self)
//        return tw
//    }()
    
    //MARK:横向滚动图片列表
    var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //设置滚动方向
        layout.itemSize = CGSize(width: 61, height: 61)//设置cell的大小
//        layout.sectionInset = UIEdgeInsets.zero//设置分组的间距
//        layout.minimumLineSpacing = 0 //设置最小行间距
//        layout.minimumInteritemSpacing = 10//设置小列间距
        
        let ucv = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 61),collectionViewLayout: layout)
        ucv.showsHorizontalScrollIndicator = false
        ucv.backgroundColor = UIColor.white
        ucv.register(cellType: URefundOrderImageCell.self)
        return ucv
    }()
    
    var btnLayer:UIView = {
        let uv = UIView()
        return uv
    }()
    
    var confirmRefund:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        ub.layer.cornerRadius = 15
        ub.layer.masksToBounds = true
        ub.setTitle("同意退款退货", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return ub
    }()
    
    var refusedRefund:UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.hex(hexString: "#FF4444")
        ub.layer.cornerRadius = 15
        ub.layer.masksToBounds = true
        ub.setTitle("拒绝退款退货", for: .normal)
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return ub
    }()
    let topView = UIView()
    let bottomView = UIView()
    
    override func configUI() {
        
        contentView.backgroundColor = UIColor.white
        
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        
        
        contentView.addSubview(topView)
        topView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(1)
            make.top.equalTo(contentView)
        }
        
        contentView.addSubview(orderNoLabel)
        orderNoLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.top.equalTo(topView).offset(15)
        }
        
        contentView.addSubview(orderStatus)
        orderStatus.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(topView).offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        contentView.addSubview(orderLine)
        orderLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.left.width.equalToSuperview()
            ConstraintMaker.top.equalTo(orderNoLabel.snp.bottom).offset(15)
        }
        
        contentView.addSubview(grayBgBtn)
        grayBgBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(orderLine.snp.bottom).offset(11)
            ConstraintMaker.height.equalTo(40)
        }
        grayBgBtn.addTarget(self, action: #selector(tapCallTheClient), for: UIControl.Event.touchUpInside)
        
        contentView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(grayBgBtn).offset(10)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        contentView.addSubview(userPhoneLabel)
        userPhoneLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userNameLabel.snp.right).offset(25)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        contentView.addSubview(contactLabel)
        contactLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(grayBgBtn).offset(-10)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
        }
        
        contentView.addSubview(phoneIcon)
        phoneIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(contactLabel.snp.left).offset(-7)
            ConstraintMaker.centerY.equalTo(grayBgBtn)
            ConstraintMaker.size.equalTo(13)
        }
        
        contentView.addSubview(goodsIcon)
        goodsIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(grayBgBtn.snp.bottom).offset(15)
            ConstraintMaker.size.equalTo(61)
        }
        
        contentView.addSubview(goodsNameLabel)
        goodsNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsIcon)
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        contentView.addSubview(goodsSpecification)
        goodsSpecification.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
            ConstraintMaker.centerY.equalTo(goodsIcon)
        }
        
        contentView.addSubview(goodsPrice)
        goodsPrice.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.equalTo(goodsIcon)
            ConstraintMaker.left.equalTo(goodsIcon.snp.right).offset(11)
        }
        
        contentView.addSubview(goodsNumber)
        goodsNumber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.bottom.equalTo(goodsIcon)
        }
        
        contentView.addSubview(goodsLine)
        goodsLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(goodsIcon.snp.bottom).offset(15)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
        
        contentView.addSubview(afterSalesLabel)
        afterSalesLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(goodsLine.snp.bottom).offset(15)
        }
        
        contentView.addSubview(afterSalesContentLabel)
        afterSalesContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(afterSalesLabel.snp.right).offset(3)
            ConstraintMaker.top.equalTo(afterSalesLabel)
        }
        
        contentView.addSubview(refundMoneyLabel)
        refundMoneyLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(afterSalesLabel.snp.bottom).offset(8)
            ConstraintMaker.left.equalTo(afterSalesLabel)
        }
        
        contentView.addSubview(refundMoneyContentLabel)
        refundMoneyContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(refundMoneyLabel.snp.right).offset(3)
            ConstraintMaker.top.equalTo(refundMoneyLabel)
        }
        
        contentView.addSubview(refundCauseLabel)
        refundCauseLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(refundMoneyLabel.snp.bottom).offset(8)
            ConstraintMaker.left.equalTo(refundMoneyLabel)
        }
        
        contentView.addSubview(refundCauseContentLabel)
        refundCauseContentLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(refundCauseLabel.snp.right).offset(3)
            ConstraintMaker.centerY.equalTo(refundCauseLabel)
        }
        
        //数据代理设置
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
//            ConstraintMaker.width.equalToSuperview().offset(30)
            ConstraintMaker.top.equalTo(refundCauseLabel.snp.bottom).offset(11)
            ConstraintMaker.height.equalTo(61)
        }
        
        contentView.addSubview(btnLayer)
        btnLayer.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(collectionView.snp.bottom).offset(15)
//            ConstraintMaker.top.equalTo(refundCauseContentLabel.snp.bottom).offset(15)
        }
        
        btnLayer.addSubview(refundLine)
        refundLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.width.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        btnLayer.addSubview(confirmRefund)
        confirmRefund.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.width.equalTo(110)
            ConstraintMaker.top.equalTo(refundLine.snp.bottom).offset(7)
        }
        confirmRefund.addTarget(self, action: #selector(tapConfirmDealWith), for: UIControl.Event.touchUpInside)
        
        btnLayer.addSubview(refusedRefund)
        refusedRefund.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(confirmRefund.snp.left).offset(-15)
            ConstraintMaker.width.equalTo(110)
            ConstraintMaker.top.equalTo(refundLine.snp.bottom).offset(7)
        }
        refusedRefund.addTarget(self, action: #selector(tapRefusedDealWith), for: UIControl.Event.touchUpInside)
        
        
        contentView.addSubview(bottomView)
        bottomView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.width.equalTo(1)
            make.height.equalTo(1)
            make.top.equalTo(btnLayer.snp.bottom)
            make.bottom.equalTo(contentView)
        }
        
    }
    
    func resetCollectionViewConstraint(picListIsNeedHide:Bool,btnIsNeedHide:Bool){
        if btnIsNeedHide {
            btnLayer.removeFromSuperview()
        } else {
            contentView.addSubview(btnLayer)
        }
        if picListIsNeedHide {
            collectionView.removeFromSuperview()
            if !btnIsNeedHide {
                btnLayer.snp.makeConstraints { (ConstraintMaker) in
                    ConstraintMaker.width.equalToSuperview()
                    ConstraintMaker.height.equalTo(44)
                    ConstraintMaker.top.equalTo(refundCauseContentLabel.snp.bottom).offset(15)
                }
            }
        } else {
            contentView.addSubview(collectionView)
            collectionView.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.left.equalToSuperview().offset(15)
                ConstraintMaker.right.equalToSuperview().offset(-15)
                ConstraintMaker.top.equalTo(refundCauseLabel.snp.bottom).offset(11)
                ConstraintMaker.height.equalTo(61)
            }
            if !btnIsNeedHide {
                btnLayer.snp.makeConstraints { (ConstraintMaker) in
                    ConstraintMaker.width.equalToSuperview()
                    ConstraintMaker.height.equalTo(44)
                    ConstraintMaker.top.equalTo(collectionView.snp.bottom).offset(15)
                }
            }
        }
        
    }
    
    @objc func tapCallTheClient(){
        callTheClient?()
    }
    
    @objc func tapConfirmDealWith(){
        confirmDealWith?()
    }
    
    @objc func tapRefusedDealWith(){
        refusedDealWith?()
    }
    
    var model: RefundOrderModel? {
        didSet {
            guard let model = model else { return }
            
            orderNoLabel.text = "订单号:\(model.order_refund_no)"
            if model.status == 0 {
                orderStatus.text = "待处理"
                orderStatus.textColor = UIColor.hex(hexString: "#FF8A17")
            } else if model.status == 0 {
                orderStatus.text = "同意并已退款"
                orderStatus.textColor = UIColor.hex(hexString: "#1C98F6")
            } else if model.status == 0 {
                orderStatus.text = "已同意换货"
                orderStatus.textColor = UIColor.hex(hexString: "#1C98F6")
            } else if model.status == 3 {
                orderStatus.text = "已拒绝退换货"
                orderStatus.textColor = UIColor.hex(hexString: "#FF4444")
            }
            userNameLabel.text = model.name
            userPhoneLabel.text = model.mobile
            let url = URL(string: model.goods_pic)
            goodsIcon.kf.setImage(with: url)
            goodsNameLabel.text = model.goods_name
            var specification = ""
            for item in model.attr {
                specification += "\(item.attr_group_name ?? "规格"):\(item.attr_name ?? "默认")"
            }
            goodsSpecification.text = specification
            goodsPrice.text = "¥\(model.total_price)元"
            goodsNumber.text = "x\(model.num)"
            afterSalesContentLabel.text = model.type == 1 ? "退货退款" : "换货"
            refundMoneyContentLabel.text = "\(model.refund_price)元"
            refundCauseContentLabel.text = model.desc
            let picListIsNeedHide = model.pic_list.count <= 0
            let btnIsNeedHide = model.status != 0
            resetCollectionViewConstraint(picListIsNeedHide: picListIsNeedHide, btnIsNeedHide: btnIsNeedHide)
            
            collectionView.reloadData()
        }
    }
}

extension URefundOrderUntreatedCell : UICollectionViewDelegate, UICollectionViewDataSource
{
    
    //MARK:section数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return model?.pic_list.count ?? 0 == 0 ? 0 :1;
    }
    
    //MARK:每个section有多少Item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return model?.pic_list.count ?? 0
    }
    
    //最小 item 间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 5;
    }
    
    //item 的尺寸
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: 61, height: 61);
    }
    
    //MARK:返回每个Item的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: URefundOrderImageCell.self)
        guard model?.pic_list == nil || model?.pic_list.count == 0 else {
            cell.data = model?.pic_list[indexPath.item]
            return cell
        }
        return cell
    }
    
}
