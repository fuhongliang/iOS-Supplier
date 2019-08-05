//
//  UHomeEvaluationCell.swift
//  MYiMei
//
//  Created by KevinFu on 2019/7/24.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class UHomeEvaluationCell: UBaseTableViewCell {
    
    var replyComment : (() -> ())?
    var hideComment : (() -> ())?
    var deleteComment : (() -> ())?
    
    //用户头像
    var userAvatarIcon = UIImageView()
    //用户名称
    var userNameLaber = UILabel()
    //时间
    var timeLaber = UILabel()
    //评价图标
    var evaluationIcon = UIImageView()
    //好评
    var goodsEvaluationLaber = UILabel()
    //评价内容
    var evaluationContentLaber = UILabel()
    //评价图片
    var evaluationPhotoOneICon = UIImageView()
    var evaluationPhotoTwoICon = UIImageView()
    var evaluationPhotoThreeICon = UIImageView()
    var evaluationPhotoLine = UILabel()
    //商家回复
    var storeReplyLaber = UILabel()
    //商家分割线
    var storeLine = UILabel()
    //回复按钮
    var replyBtn = UIButton()
    //隐藏按钮
    var hideBtn = UIButton()
    //删除按钮
    var deleteBtn = UIButton()
    
    override func configUI() {
        contentView.backgroundColor = UIColor.white//UIColor.hex(hexString: "#F5F5F5")
        
        let topView = UIView()
        contentView.addSubview(topView)
        topView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            make.height.equalTo(1)
            make.top.equalTo(contentView).offset(10)
        }
        
        userAvatarIcon.image = UIImage.init(named: "about_us")
        contentView.addSubview(userAvatarIcon)
        userAvatarIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(contentView).offset(12)
            ConstraintMaker.size.equalTo(33)
        }
        userNameLaber.text = "傻妞"
        userNameLaber.textColor = UIColor.hex(hexString: "#333333")
        userNameLaber.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(userNameLaber)
        userNameLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userAvatarIcon.snp.right).offset(10)
            ConstraintMaker.top.equalTo(userAvatarIcon)
        }
        timeLaber.text = "2019-09-22"
        timeLaber.textColor = UIColor.hex(hexString: "#999999")
        timeLaber.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(timeLaber)
        timeLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(userAvatarIcon.snp.right).offset(10)
            ConstraintMaker.bottom.equalTo(userAvatarIcon)
        }
        goodsEvaluationLaber.text = "好评"
        goodsEvaluationLaber.textColor = UIColor.hex(hexString: "#333333")
        goodsEvaluationLaber.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(goodsEvaluationLaber)
        goodsEvaluationLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(userAvatarIcon)
            ConstraintMaker.right.equalToSuperview().offset(-15)
        }
        
        evaluationIcon.image = UIImage.init(named: "about_us")
        contentView.addSubview(evaluationIcon)
        evaluationIcon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerY.equalTo(userAvatarIcon)
            ConstraintMaker.right.equalTo(goodsEvaluationLaber.snp.left).offset(-8)
            ConstraintMaker.size.equalTo(16)
        }
        evaluationContentLaber.text = "速度快 本来打算要半个月时间呢 13天就到货 五个师傅同时按装 大牌子好用 不用你动手 师傅那速度 很开心的一次购物"
        evaluationContentLaber.textColor = UIColor.hex(hexString: "#003333")
        evaluationContentLaber.font = UIFont.systemFont(ofSize: 13)
        evaluationContentLaber.numberOfLines = 0
        evaluationContentLaber.preferredMaxLayoutWidth = screenWidth - 30
        contentView.addSubview(evaluationContentLaber)
        evaluationContentLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview().inset(15)
            ConstraintMaker.width.equalTo(screenWidth-30)
            ConstraintMaker.top.equalTo(userAvatarIcon.snp.bottom).offset(15)
        }
//        evaluationPhotoOneICon.image = UIImage.init(named: "about_us")
        contentView.addSubview(evaluationPhotoOneICon)
        evaluationPhotoOneICon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(evaluationContentLaber.snp.bottom).offset(10)
            ConstraintMaker.height.equalTo(90)
            ConstraintMaker.width.equalTo(105)
        }
//        evaluationPhotoTwoICon.image = UIImage.init(named: "about_us")
        contentView.addSubview(evaluationPhotoTwoICon)
        evaluationPhotoTwoICon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.centerY.equalTo(evaluationPhotoOneICon)
            ConstraintMaker.height.equalTo(90)
            ConstraintMaker.width.equalTo(105)
        }
//        evaluationPhotoThreeICon.image = UIImage.init(named: "about_us")
        contentView.addSubview(evaluationPhotoThreeICon)
        evaluationPhotoThreeICon.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.centerY.equalTo(evaluationPhotoOneICon)
            ConstraintMaker.height.equalTo(90)
            ConstraintMaker.width.equalTo(105)
        }
        evaluationPhotoLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(evaluationPhotoLine)
        evaluationPhotoLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(evaluationPhotoThreeICon.snp.bottom)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(1)
        }
        
        storeReplyLaber.text = "商家回复：\n感谢您对我们的支持与厚爱，您的满意就是我们最大的动力，谢谢您对我们的肯定。我们会继续努力的。"
        storeReplyLaber.textColor = UIColor.hex(hexString: "#FF4444")
        storeReplyLaber.numberOfLines = 0
        storeReplyLaber.lineBreakMode = NSLineBreakMode.byWordWrapping
        storeReplyLaber.font = UIFont.systemFont(ofSize: 12)
        storeReplyLaber.preferredMaxLayoutWidth = screenWidth - 30
        contentView.addSubview(storeReplyLaber)
        storeReplyLaber.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview().inset(15)
            ConstraintMaker.top.equalTo(evaluationPhotoLine.snp.bottom).offset(11)
        }
        
        storeLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        contentView.addSubview(storeLine)
        storeLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.top.equalTo(storeReplyLaber.snp.bottom).offset(11)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
        }
        
        
        replyBtn.setTitle("回复", for: UIControl.State.normal)
        replyBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        replyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        replyBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        replyBtn.layer.masksToBounds = true
        replyBtn.layer.cornerRadius = 3
        contentView.addSubview(replyBtn)
        replyBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeLine.snp.bottom).offset(8)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(27)
            ConstraintMaker.width.equalTo(60)
        }
        replyBtn.addTarget(self, action: #selector(tapReplyComment), for: UIControl.Event.touchUpInside)

        hideBtn.setTitle("隐藏", for: UIControl.State.normal)
        hideBtn.setTitleColor(UIColor.hex(hexString: "#999999"), for: UIControl.State.normal)
        hideBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        hideBtn.backgroundColor = UIColor.white
        hideBtn.layer.masksToBounds = true
        hideBtn.layer.cornerRadius = 3
        hideBtn.layer.borderWidth = 1
        hideBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        contentView.addSubview(hideBtn)
        hideBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeLine.snp.bottom).offset(8)
            ConstraintMaker.right.equalTo(replyBtn.snp.left).offset(-15)
            ConstraintMaker.height.equalTo(27)
            ConstraintMaker.width.equalTo(60)
        }
        hideBtn.addTarget(self, action: #selector(tapHideComment), for: UIControl.Event.touchUpInside)

        deleteBtn.setTitle("删除", for: UIControl.State.normal)
        deleteBtn.setTitleColor(UIColor.hex(hexString: "#999999"), for: UIControl.State.normal)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        deleteBtn.backgroundColor = UIColor.white
        deleteBtn.layer.masksToBounds = true
        deleteBtn.layer.cornerRadius = 3
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        contentView.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(storeLine.snp.bottom).offset(8)
            ConstraintMaker.right.equalTo(hideBtn.snp.left).offset(-15)
            ConstraintMaker.height.equalTo(27)
            ConstraintMaker.width.equalTo(60)
        }
        deleteBtn.addTarget(self, action: #selector(tapDeleteComment), for: UIControl.Event.touchUpInside)
        
        let bottomView = UIView()
        contentView.addSubview(bottomView)
        bottomView.snp.makeConstraints{(make)->Void in
            make.left.equalTo(contentView)
            make.width.equalTo(1)
            make.height.equalTo(1)
            make.top.equalTo(deleteBtn.snp.bottom).offset(8)
            make.bottom.equalTo(contentView)
        }
    }
    
    //MARK:设置label的行间距
    func setMutableAttributedText(content:String,label:UILabel) {
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: content)
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7 //大小调整
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, content.count))
        label.attributedText = attributedString
        label.sizeToFit()
    }
    
    //MARK:重置图片的约束
    func resetConstraint(picListNil:Bool,replyContentNil:Bool){
        
        if replyContentNil {
            evaluationPhotoLine.backgroundColor = UIColor.white
        } else {
            evaluationPhotoLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        }
        
        if picListNil {
            evaluationPhotoOneICon.removeFromSuperview()
            evaluationPhotoTwoICon.removeFromSuperview()
            evaluationPhotoThreeICon.removeFromSuperview()
            evaluationPhotoLine.removeFromSuperview()
            storeReplyLaber.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.left.right.equalToSuperview().inset(15)
                ConstraintMaker.top.equalTo(evaluationContentLaber.snp.bottom).offset(11)
            }
        } else {
            contentView.addSubview(evaluationPhotoOneICon)
            contentView.addSubview(evaluationPhotoTwoICon)
            contentView.addSubview(evaluationPhotoThreeICon)
            contentView.addSubview(evaluationPhotoLine)
            evaluationPhotoOneICon.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.left.equalToSuperview().offset(15)
                ConstraintMaker.top.equalTo(userAvatarIcon.snp.bottom).offset(10)
                ConstraintMaker.height.equalTo(90)
                ConstraintMaker.width.equalTo(105)
            }
            evaluationPhotoTwoICon.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.centerX.equalToSuperview()
                ConstraintMaker.centerY.equalTo(evaluationPhotoOneICon)
                ConstraintMaker.height.equalTo(90)
                ConstraintMaker.width.equalTo(105)
            }
            evaluationPhotoThreeICon.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.right.equalToSuperview().offset(-15)
                ConstraintMaker.centerY.equalTo(evaluationPhotoOneICon)
                ConstraintMaker.height.equalTo(90)
                ConstraintMaker.width.equalTo(105)
            }
            evaluationPhotoLine.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.left.equalToSuperview().offset(15)
                ConstraintMaker.top.equalTo(evaluationPhotoOneICon.snp.bottom).offset(10)
                ConstraintMaker.right.equalToSuperview().offset(-15)
                ConstraintMaker.height.equalTo(1)
            }
            storeReplyLaber.snp.makeConstraints { (ConstraintMaker) in
                ConstraintMaker.left.right.equalToSuperview().inset(15)
                ConstraintMaker.top.equalTo(evaluationPhotoLine.snp.bottom).offset(11)
            }
        }
    }
    
    
    @objc func tapReplyComment() {
        replyComment?()
    }
    
    @objc func tapHideComment() {
        hideComment?()
    }
    
    @objc func tapDeleteComment(){
        deleteComment?()
    }
     
    var model: CommentModel? {
        didSet {
            guard let model = model else { return }

            let url = URL(string: model.avatar )
            userAvatarIcon.kf.setImage(with: url)
            userNameLaber.text = model.name
            let replyContent = model.reply_content ?? ""
            if replyContent == "" {
                setMutableAttributedText(content: replyContent, label: storeReplyLaber)
            } else {
                setMutableAttributedText(content: "商家回复:\n\(replyContent)", label: storeReplyLaber)
            }
            setMutableAttributedText(content: model.content,label: evaluationContentLaber)
            
            timeLaber.text = dateForMatter(timeString: model.addtime , join: " ")
            if Int(model.score) == 1 {
                goodsEvaluationLaber.text = "差评"
                evaluationIcon.image = UIImage.init(named: "comment_bad")
            } else if Int(model.score) == 2 {
                goodsEvaluationLaber.text = "中评"
                evaluationIcon.image = UIImage.init(named: "comment_middle")
            } else {
                goodsEvaluationLaber.text = "好评"
                evaluationIcon.image = UIImage.init(named: "comment_good")
            }
            hideBtn.setTitle(model.is_hide == 1 ? "显示" : "隐藏", for: UIControl.State.normal)
            
            let replyContentIsNil = (model.reply_content == "" ? true : false)
            let picListIsNil = (model.pic_list.count == 0 ? true : false)
            
            resetConstraint(picListNil: picListIsNil, replyContentNil: replyContentIsNil)
            
            
            var imageArray = [evaluationPhotoOneICon, evaluationPhotoTwoICon, evaluationPhotoThreeICon]
            for index in 0..<model.pic_list.count {
                let url = URL(string: model.pic_list?[index] ?? "")
                imageArray[index].kf.setImage(with: url)
            }
            
        }
    }
    
}
