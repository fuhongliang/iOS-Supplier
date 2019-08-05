//
//  UGoodsDetailView.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/6/27.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

protocol UGoodsDetailViewDelegate: AnyObject {
    //选择商品缩略图
    func tapChooseGoodsSLTAction()
    //选择商品主图
    func tapChooseGoodsPicAction()

    //选择商品描述
    func tapAddGoodsDescrAction()

    //选择平台分类
    func tapChooseCateAction()

    //选择商品分类
    func tapChooseGoodsCateAction()

    //点击选择标签
    func tapChooseGoodsTagAction(tag:UIButton)

    //点击保存按钮
    func tapSaveAction(name:String,
                       unit:String,weight:String,original_price:String,
                       price:String,pieces:String,forehead:String,goods_num:String)
}

class UGoodsDetailView: BaseView {
    //MARK:商品名称
    var goodsNameTF = UITextField()
    //MARK:分割线
    var line = UIImageView()

    //MARK:白色的背景
    var bgWhite = UIImageView()


    //MARK:商品缩略图
    var addGoodsCoverPic = UIButton()

    //MARK:商品主图
    var addGoodsPic = UIButton()

    //MARK:商品描述白色的背景
    var goodsDescrBgWhite = UIImageView()

    //商品描述
    var goodsDescrLabel = UILabel()

    //选择商品描述
    var goodsDescrBtn = UIButton()

    var goodsDescrArrowRight = UIImageView()


    //MARK:分类的白色的背景
    var categoryBgWhite = UIImageView()

    //MARK:平台、商品分类
    var platformClassLabel = UILabel()
    var classLine = UIImageView()
    //选择平台分类
    var choosePlatformClassBtn = UIButton()
    var arrowRight = UIImageView()
    //商品分类
    var goodsClassLabel = UILabel()
    //选择商品分类
    var choosegoodsClassBtn = UIButton()
    var goodsArrowRight = UIImageView()

    //MARK:单位白色的背景
    var unitBgWhite = UIImageView()

    //MARK:单位
    var unitClassLabel = UILabel()
    //单位输入
    var unitClassTF = UITextField()
    var unitLine = UIImageView()

    //MARK:重量
    var weightLabel = UILabel()
    var weightTF = UITextField()
    var weightUnitLabel = UILabel()
    var weightLine = UIImageView()

    //MARK:原价
    var originalPriceLabel = UILabel()
    var originalPriceTF = UITextField()
    var originalPriceUnitLabel = UILabel()
    var originalPriceLine = UIImageView()

    //MARK:售价
    var goodsPriceLabel = UILabel()
    var goodsPriceTF = UITextField()
    var goodsPriceUnitLabel = UILabel()
    var goodsPriceLine = UILabel()

    //MARK:库存
    var amountLabel = UILabel()
    var amountTF = UITextField()

    //MARK:单品满件包邮
    var piecesBgWhite = UIImageView()
    var piecesHeadDesrcLabel = UILabel()
    var piecesDesrcLabel = UILabel()
    var piecesDesrcTF = UITextField()
    var piecesDesrcLine = UIImageView()

    //MARK:单品满额包邮
    var foreheadBgWhite = UIImageView()
    var foreHeadDesrcLabel = UILabel()
    var foreDesrcLabel = UILabel()
    var foreDesrcTF = UITextField()
    var foreDesrcLine = UIImageView()

    //MARK:服务标签
    var tagsBgWhite = UIImageView()
    var servicesDesrcLabel = UILabel()
    var recommendTagsLabel = UILabel()
    
    //MARK:标签按钮
    var doorDeliveryTagBtn = UIButton()
    var professionalInstallationTagBtn = UIButton()
    var doorReturnTagBtn = UIButton()
    var qualityAssuranceCommitmentTagBtn = UIButton()
    var realThingReleasedTagBtn = UIButton()
    var newPreferentialTagBtn = UIButton()
    var restAssuredBuyTagBtn = UIButton()
    
    //MARK:保存
    var saveBtn = UIButton()

    weak var delegate: UGoodsDetailViewDelegate?

    func configUI() {
        //MARK:商品名称
        goodsNameTF.backgroundColor = UIColor.white
        goodsNameTF.textColor = UIColor.black
        goodsNameTF.tintColor = UIColor.hex(hexString: "#CCCCCC")
        goodsNameTF.font = UIFont.systemFont(ofSize: 17)
        goodsNameTF.placeholder = "商品名称 (250字以内)"
        goodsNameTF.dl_maxLength = 30
        let leftview = UIView()
        leftview.frame = CGRect(x: 0, y: 0, width: 10, height: 44)
        leftview.frame.size.width = 15//设置左边距的大小
        leftview.backgroundColor = UIColor.white
        goodsNameTF.leftViewMode = UITextField.ViewMode.always
        goodsNameTF.leftView = leftview;
        self.addSubview(goodsNameTF)
        goodsNameTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.width.equalTo(screenWidth)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalToSuperview()
        }
        //MARK:白色背景
        bgWhite.backgroundColor = UIColor.white
        self.addSubview(bgWhite)
        bgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(90)
            ConstraintMaker.top.equalTo(goodsNameTF.snp.bottom)
        }

        //MARK:分割线
        line.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(line)
        line.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(goodsNameTF.snp.bottom)
        }

        //MARK:添加缩略图
        addGoodsCoverPic.backgroundColor = UIColor.white
        addGoodsCoverPic.setBackgroundImage(UIImage.init(named: "add_goods_slt"), for: UIControl.State.normal)
        addGoodsCoverPic.layer.masksToBounds = true
        addGoodsCoverPic.layer.cornerRadius = 1
        self.addSubview(addGoodsCoverPic)
        addGoodsCoverPic.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(5)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(70)
            ConstraintMaker.width.equalTo(70)
        }

        //MARK:添加商品图
        addGoodsPic.backgroundColor = UIColor.white
        addGoodsPic.setBackgroundImage(UIImage.init(named: "add_goods_pic"), for: UIControl.State.normal)
        addGoodsPic.layer.masksToBounds = true
        addGoodsPic.layer.cornerRadius = 1
        self.addSubview(addGoodsPic)
        addGoodsPic.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(line.snp.bottom).offset(5)
            ConstraintMaker.left.equalTo(addGoodsCoverPic.snp.right).offset(15)
            ConstraintMaker.height.equalTo(70)
            ConstraintMaker.width.equalTo(70)
        }
        addGoodsCoverPic.addTarget(self, action: #selector(tapChooseGoodsSLTAction), for: UIControl.Event.touchDown)
        addGoodsPic.addTarget(self, action: #selector(tapChooseGoodsPicAction), for: UIControl.Event.touchDown)

//-------------------------------------------------

        //MARK:白色背景
        goodsDescrBgWhite.backgroundColor = UIColor.white
        self.addSubview(goodsDescrBgWhite)
        goodsDescrBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(bgWhite.snp.bottom).offset(15)
        }

        goodsDescrLabel.text = "商品描述"
        goodsDescrLabel.font = UIFont.systemFont(ofSize: 17)
        goodsDescrLabel.textColor = UIColor.black

        self.addSubview(goodsDescrLabel)
        goodsDescrLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(goodsDescrBgWhite.snp.top).offset(14)
        }

        //MARK:请添加商品描述
        goodsDescrBtn.setTitle("请添加商品描述", for: UIControl.State.normal)
        goodsDescrBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        goodsDescrBtn.titleLabel?.tintColor = UIColor.hex(hexString: "#CCCCCC")
        goodsDescrBtn.titleLabel?.textColor = UIColor.black
        goodsDescrBtn.contentHorizontalAlignment = .right
        goodsDescrBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.addSubview(goodsDescrBtn)
        goodsDescrBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsDescrLabel).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-34)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(goodsDescrBgWhite.snp.top)
        }

        goodsDescrBtn.addTarget(self, action: #selector(addGoodsDescrAction), for: UIControl.Event.touchDown)

        goodsDescrArrowRight.image = UIImage.init(named: "right_arrow")
        self.addSubview(goodsDescrArrowRight)
        goodsDescrArrowRight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsDescrBtn.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(8)
            ConstraintMaker.top.equalTo(goodsDescrBgWhite.snp.top).offset(15)
        }
//-------------------------------------------------


        //MARK:白色背景
        categoryBgWhite.backgroundColor = UIColor.white
        self.addSubview(categoryBgWhite)
        categoryBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(89)
            ConstraintMaker.top.equalTo(goodsDescrBgWhite.snp.bottom).offset(15)
        }

        //MARK:单位的白色背景
        unitBgWhite.backgroundColor = UIColor.white
        self.addSubview(unitBgWhite)
        unitBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(227)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.bottom).offset(15)
        }

        //piecesBgWhite
        piecesBgWhite.backgroundColor = UIColor.white
        self.addSubview(piecesBgWhite)
        piecesBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(unitBgWhite.snp.bottom).offset(44)
        }

        //foreheadBgWhite
        foreheadBgWhite.backgroundColor = UIColor.white
        self.addSubview(foreheadBgWhite)
        foreheadBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(piecesBgWhite.snp.bottom).offset(44)
        }

        //tagsBgWhite
        tagsBgWhite.backgroundColor = UIColor.white
        self.addSubview(tagsBgWhite)
        tagsBgWhite.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview()
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(123)
            ConstraintMaker.top.equalTo(foreheadBgWhite.snp.bottom).offset(44)
        }

        platformClassLabel.text = "平台分类"
        platformClassLabel.font = UIFont.systemFont(ofSize: 17)
        platformClassLabel.textColor = UIColor.black

        self.addSubview(platformClassLabel)
        platformClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(14)
        }
        
        //MARK:平台分类选择
        choosePlatformClassBtn.setTitle("请选择平台分类", for: UIControl.State.normal)
        choosePlatformClassBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        choosePlatformClassBtn.titleLabel?.tintColor = UIColor.hex(hexString: "#CCCCCC")
        choosePlatformClassBtn.titleLabel?.textColor = UIColor.black
        choosePlatformClassBtn.contentHorizontalAlignment = .right
        choosePlatformClassBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.addSubview(choosePlatformClassBtn)
        choosePlatformClassBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(platformClassLabel).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-34)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top)
        }

        choosePlatformClassBtn.addTarget(self, action: #selector(chooseCateAction), for: UIControl.Event.touchDown)

        arrowRight.image = UIImage.init(named: "right_arrow")
        self.addSubview(arrowRight)
        arrowRight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(choosePlatformClassBtn.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(8)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(15)
        }
        //MARK:分类的分割线
        classLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(classLine)
        classLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(categoryBgWhite.snp.top).offset(44)
        }


        goodsClassLabel.text = "商品分类"
        goodsClassLabel.font = UIFont.systemFont(ofSize: 17)
        goodsClassLabel.textColor = UIColor.black

        self.addSubview(goodsClassLabel)
        goodsClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(classLine.snp.top).offset(14)
        }
        //MARK:选择商品分类
        choosegoodsClassBtn.setTitle("请选择商品分类", for: UIControl.State.normal)
        choosegoodsClassBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        choosegoodsClassBtn.titleLabel?.tintColor = UIColor.hex(hexString: "#CCCCCC")
        choosegoodsClassBtn.titleLabel?.textColor = UIColor.black
        choosegoodsClassBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        choosegoodsClassBtn.contentHorizontalAlignment = .right
        self.addSubview(choosegoodsClassBtn)
        choosegoodsClassBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(goodsClassLabel).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-34)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.top.equalTo(classLine.snp.top)
        }
        choosegoodsClassBtn.addTarget(self, action: #selector(chooseGoodsCateAction), for: UIControl.Event.touchDown)

        
        goodsArrowRight.image = UIImage.init(named: "right_arrow")
        self.addSubview(goodsArrowRight)
        goodsArrowRight.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(choosegoodsClassBtn.snp.right).offset(10)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(13)
            ConstraintMaker.width.equalTo(8)
            ConstraintMaker.top.equalTo(classLine.snp.top).offset(15)
        }
        
        //MARK:单位
        unitClassLabel.text = "单位"
        unitClassLabel.font = UIFont.systemFont(ofSize: 17)
        unitClassLabel.textColor = UIColor.black
        self.addSubview(unitClassLabel)
        unitClassLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(unitBgWhite.snp.top).offset(14)
        }
        
        unitClassTF.placeholder = "请填写单位，如：个、件"
        unitClassTF.font = UIFont.systemFont(ofSize: 17)
        unitClassTF.textAlignment = .right
        unitClassTF.dl_maxLength = 5
        self.addSubview(unitClassTF)
        unitClassTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(unitBgWhite.snp.top).offset(1)
        }
        
        unitLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(unitLine)
        unitLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(unitClassTF.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }


        //MARK:重量
        weightLabel.text = "重量"
        weightLabel.font = UIFont.systemFont(ofSize: 17)
        weightLabel.textColor = UIColor.black
        self.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(unitLine.snp.bottom).offset(14)
        }
        
        weightUnitLabel.text = "克"
        weightUnitLabel.font = UIFont.systemFont(ofSize: 17)
        weightUnitLabel.textColor = UIColor.black
        self.addSubview(weightUnitLabel)
        weightUnitLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(unitLine.snp.top).offset(13)
        }
        
        weightTF.placeholder = "请输入"
        weightTF.font = UIFont.systemFont(ofSize: 17)
        weightTF.textAlignment = .right
        weightTF.keyboardType = UIKeyboardType.numberPad
        self.addSubview(weightTF)
        weightTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(weightUnitLabel.snp.left).offset(-10)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(unitLine.snp.bottom)
        }
        
        weightLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(weightLine)
        weightLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(weightTF.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //MARK:原价
        originalPriceLabel.text = "原价"
        originalPriceLabel.font = UIFont.systemFont(ofSize: 17)
        originalPriceLabel.textColor = UIColor.black
        self.addSubview(originalPriceLabel)
        originalPriceLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(weightLine.snp.bottom).offset(14)
        }
        
        originalPriceUnitLabel.text = "元"
        originalPriceUnitLabel.font = UIFont.systemFont(ofSize: 17)
        originalPriceUnitLabel.textColor = UIColor.black
        self.addSubview(originalPriceUnitLabel)
        originalPriceUnitLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(weightLine.snp.top).offset(13)
            
        }
        
        originalPriceTF.placeholder = "请输入"
        originalPriceTF.font = UIFont.systemFont(ofSize: 17)
        originalPriceTF.textAlignment = .right
        originalPriceTF.keyboardType = UIKeyboardType.decimalPad
        self.addSubview(originalPriceTF)
        originalPriceTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(originalPriceUnitLabel.snp.left).offset(-10)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(weightLine.snp.bottom)
        }
        
        originalPriceLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(originalPriceLine)
        originalPriceLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(originalPriceTF.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //MARK:售价
        goodsPriceLabel.text = "售价"
        goodsPriceLabel.font = UIFont.systemFont(ofSize: 17)
        goodsPriceLabel.textColor = UIColor.black
        self.addSubview(goodsPriceLabel)
        goodsPriceLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(originalPriceLine.snp.bottom).offset(14)
        }

        goodsPriceUnitLabel.text = "元"
        goodsPriceUnitLabel.font = UIFont.systemFont(ofSize: 17)
        goodsPriceUnitLabel.textColor = UIColor.black
        self.addSubview(goodsPriceUnitLabel)
        goodsPriceUnitLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(originalPriceLine.snp.top).offset(13)
        }

        goodsPriceTF.placeholder = "请输入"
        goodsPriceTF.font = UIFont.systemFont(ofSize: 17)
        goodsPriceTF.textAlignment = .right
        goodsPriceTF.keyboardType = UIKeyboardType.decimalPad
        self.addSubview(goodsPriceTF)
        goodsPriceTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(goodsPriceUnitLabel.snp.left).offset(-10)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(originalPriceLine.snp.bottom)
        }
        
        goodsPriceLine.backgroundColor = UIColor.hex(hexString: "#F2F2F2")
        self.addSubview(goodsPriceLine)
        goodsPriceLine.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.height.equalTo(1)
            ConstraintMaker.top.equalTo(goodsPriceTF.snp.bottom)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview()
        }
        
        //MARK:商品库存
        amountLabel.text = "商品库存"
        amountLabel.font = UIFont.systemFont(ofSize: 17)
        amountLabel.textColor = UIColor.black
        self.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.height.equalTo(16)
            ConstraintMaker.top.equalTo(goodsPriceLine.snp.bottom).offset(14)
        }

        amountTF.placeholder = "请填写库存(超过99999将调整为库存无限)"
        amountTF.font = UIFont.systemFont(ofSize: 17)
        amountTF.textAlignment = .right
        amountTF.keyboardType = UIKeyboardType.numberPad
        amountTF.dl_maxLength = 5
        self.addSubview(amountTF)
        amountTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
            ConstraintMaker.top.equalTo(goodsPriceLine.snp.bottom)
        }
        amountTF.delegate = self
        
        //MARK:单品满件包邮
        piecesHeadDesrcLabel.text = "如果设置0或空，则不支持满额包邮"
        piecesHeadDesrcLabel.font = UIFont.systemFont(ofSize: 14)
        piecesHeadDesrcLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(piecesHeadDesrcLabel)
        piecesHeadDesrcLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(14)
            ConstraintMaker.top.equalTo(unitBgWhite.snp.bottom).offset(20)
        }
        
        piecesDesrcLabel.text = "单品满件包邮"
        piecesDesrcLabel.font = UIFont.systemFont(ofSize: 17)
        piecesDesrcLabel.textColor = UIColor.black
        self.addSubview(piecesDesrcLabel)
        piecesDesrcLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(piecesBgWhite.snp.top).offset(12)
        }
        
        piecesDesrcTF.placeholder = "请输入"
        piecesDesrcTF.textAlignment = .right
        piecesDesrcTF.font = UIFont.systemFont(ofSize: 17)
        piecesDesrcTF.keyboardType = UIKeyboardType.numberPad
        self.addSubview(piecesDesrcTF)
        piecesDesrcTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(piecesBgWhite)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
        }
        
        //MARK:单品满额包邮
        foreHeadDesrcLabel.text = "如果设置0或空，则不支持满额包邮"
        foreHeadDesrcLabel.font = UIFont.systemFont(ofSize: 14)
        foreHeadDesrcLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(foreHeadDesrcLabel)
        foreHeadDesrcLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(14)
            ConstraintMaker.top.equalTo(piecesBgWhite.snp.bottom).offset(20)
        }
        
        foreDesrcLabel.text = "单品满额包邮"
        foreDesrcLabel.font = UIFont.systemFont(ofSize: 17)
        foreDesrcLabel.textColor = UIColor.black
        self.addSubview(foreDesrcLabel)
        foreDesrcLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(foreheadBgWhite.snp.top).offset(12)
        }
        
        foreDesrcTF.placeholder = "请输入"
        foreDesrcTF.textAlignment = .right
        foreDesrcTF.font = UIFont.systemFont(ofSize: 17)
        foreDesrcTF.keyboardType = UIKeyboardType.numberPad
        self.addSubview(foreDesrcTF)
        foreDesrcTF.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.top.equalTo(foreheadBgWhite)
            ConstraintMaker.height.equalTo(44)
            ConstraintMaker.width.equalTo(200)
        }
        
        //MARK:服务标签
        servicesDesrcLabel.text = "服务标签，最多可添加4个服务类型"
        servicesDesrcLabel.font = UIFont.systemFont(ofSize: 14)
        servicesDesrcLabel.textColor = UIColor.hex(hexString: "#808080")
        self.addSubview(servicesDesrcLabel)
        servicesDesrcLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(14)
            ConstraintMaker.top.equalTo(foreheadBgWhite.snp.bottom).offset(20)
        }
        
        recommendTagsLabel.text = "推荐标签"
        recommendTagsLabel.font = UIFont.systemFont(ofSize: 14)
        recommendTagsLabel.textColor = UIColor.hex(hexString: "#666666")
        self.addSubview(recommendTagsLabel)
        recommendTagsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(14)
            ConstraintMaker.top.equalTo(tagsBgWhite.snp.top).offset(15)
        }
        
        //MARK:标签按钮
        doorDeliveryTagBtn.setTitle("送货入户", for: .normal)
        doorDeliveryTagBtn.setTitleColor(UIColor.black, for: .normal)
        doorDeliveryTagBtn.setTitleColor(UIColor.white, for: .selected)
        doorDeliveryTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        doorDeliveryTagBtn.clipsToBounds = true
        doorDeliveryTagBtn.layer.cornerRadius = 4
        doorDeliveryTagBtn.layer.borderWidth = 0.5
        doorDeliveryTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        doorDeliveryTagBtn.backgroundColor = UIColor.white
        self.addSubview(doorDeliveryTagBtn)
        doorDeliveryTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(tagsBgWhite.snp.left).offset(11)
            ConstraintMaker.top.equalTo(recommendTagsLabel.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        doorDeliveryTagBtn.addTarget(self, action: #selector(chooseTag1Action), for: UIControl.Event.touchDown)
        
        professionalInstallationTagBtn.setTitle("专业安装", for: .normal)
        professionalInstallationTagBtn.setTitleColor(UIColor.black, for: .normal)
        professionalInstallationTagBtn.setTitleColor(UIColor.white, for: .selected)
        professionalInstallationTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        professionalInstallationTagBtn.clipsToBounds = true
        professionalInstallationTagBtn.layer.cornerRadius = 4
        professionalInstallationTagBtn.layer.borderWidth = 0.5
        professionalInstallationTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        professionalInstallationTagBtn.backgroundColor = UIColor.white
        self.addSubview(professionalInstallationTagBtn)
        professionalInstallationTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(doorDeliveryTagBtn.snp.right).offset(11)
            ConstraintMaker.top.equalTo(recommendTagsLabel.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        professionalInstallationTagBtn.addTarget(self, action: #selector(chooseTag2Action), for: UIControl.Event.touchDown)
        
        doorReturnTagBtn.setTitle("上门退换", for: .normal)
        doorReturnTagBtn.setTitleColor(UIColor.black, for: .normal)
        doorReturnTagBtn.setTitleColor(UIColor.white, for: .selected)
        doorReturnTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        doorReturnTagBtn.clipsToBounds = true
        doorReturnTagBtn.layer.cornerRadius = 4
        doorReturnTagBtn.layer.borderWidth = 0.5
        doorReturnTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        doorReturnTagBtn.backgroundColor = UIColor.white
        self.addSubview(doorReturnTagBtn)
        doorReturnTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(professionalInstallationTagBtn.snp.right).offset(11)
            ConstraintMaker.top.equalTo(recommendTagsLabel.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        doorReturnTagBtn.addTarget(self, action: #selector(chooseTag3Action), for: UIControl.Event.touchDown)
        
        qualityAssuranceCommitmentTagBtn.setTitle("质保承诺", for: .normal)
        qualityAssuranceCommitmentTagBtn.setTitleColor(UIColor.black, for: .normal)
        qualityAssuranceCommitmentTagBtn.setTitleColor(UIColor.white, for: .selected)
        qualityAssuranceCommitmentTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        qualityAssuranceCommitmentTagBtn.clipsToBounds = true
        qualityAssuranceCommitmentTagBtn.layer.cornerRadius = 4
        qualityAssuranceCommitmentTagBtn.layer.borderWidth = 0.5
        qualityAssuranceCommitmentTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        qualityAssuranceCommitmentTagBtn.backgroundColor = UIColor.white
        self.addSubview(qualityAssuranceCommitmentTagBtn)
        qualityAssuranceCommitmentTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(doorReturnTagBtn.snp.right).offset(11)
            ConstraintMaker.top.equalTo(recommendTagsLabel.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        qualityAssuranceCommitmentTagBtn.addTarget(self, action: #selector(chooseTag4Action), for: UIControl.Event.touchDown)

        realThingReleasedTagBtn.setTitle("正品行货", for: .normal)
        realThingReleasedTagBtn.setTitleColor(UIColor.black, for: .normal)
        realThingReleasedTagBtn.setTitleColor(UIColor.white, for: .selected)
        realThingReleasedTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        realThingReleasedTagBtn.clipsToBounds = true
        realThingReleasedTagBtn.layer.cornerRadius = 4
        realThingReleasedTagBtn.layer.borderWidth = 0.5
        realThingReleasedTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        realThingReleasedTagBtn.backgroundColor = UIColor.white
        self.addSubview(realThingReleasedTagBtn)
        realThingReleasedTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(tagsBgWhite.snp.left).offset(11)
            ConstraintMaker.top.equalTo(doorDeliveryTagBtn.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        realThingReleasedTagBtn.addTarget(self, action: #selector(chooseTag5Action), for: UIControl.Event.touchDown)

        newPreferentialTagBtn.setTitle("新品特惠", for: .normal)
        newPreferentialTagBtn.setTitleColor(UIColor.black, for: .normal)
        newPreferentialTagBtn.setTitleColor(UIColor.white, for: .selected)
        newPreferentialTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        newPreferentialTagBtn.clipsToBounds = true
        newPreferentialTagBtn.layer.cornerRadius = 4
        newPreferentialTagBtn.layer.borderWidth = 0.5
        newPreferentialTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        newPreferentialTagBtn.backgroundColor = UIColor.white
        self.addSubview(newPreferentialTagBtn)
        newPreferentialTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(realThingReleasedTagBtn.snp.right).offset(11)
            ConstraintMaker.top.equalTo(doorDeliveryTagBtn.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        newPreferentialTagBtn.addTarget(self, action: #selector(chooseTag6Action), for: UIControl.Event.touchDown)

        restAssuredBuyTagBtn.setTitle("放心购买", for: .normal)
        restAssuredBuyTagBtn.setTitleColor(UIColor.black, for: .normal)
        restAssuredBuyTagBtn.setTitleColor(UIColor.white, for: .selected)
        restAssuredBuyTagBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        restAssuredBuyTagBtn.clipsToBounds = true
        restAssuredBuyTagBtn.layer.cornerRadius = 4
        restAssuredBuyTagBtn.layer.borderWidth = 0.5
        restAssuredBuyTagBtn.layer.borderColor = UIColor.hex(hexString: "#E6E6E6").cgColor
        restAssuredBuyTagBtn.backgroundColor = UIColor.white
        self.addSubview(restAssuredBuyTagBtn)
        restAssuredBuyTagBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalTo(newPreferentialTagBtn.snp.right).offset(11)
            ConstraintMaker.top.equalTo(doorDeliveryTagBtn.snp.bottom).offset(11)
            ConstraintMaker.width.equalTo(79)
        }
        restAssuredBuyTagBtn.addTarget(self, action: #selector(chooseTag7Action), for: UIControl.Event.touchDown)
        //MARK:保存按钮
        saveBtn.setTitle("保存", for: .normal)
        saveBtn.setTitleColor(UIColor.white, for: .normal)
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        saveBtn.clipsToBounds = true
        saveBtn.layer.cornerRadius = 4
        saveBtn.backgroundColor = UIColor.hex(hexString: "#1C98F6")
        self.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(tagsBgWhite.snp.bottom).offset(31)
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.right.equalToSuperview().offset(-15)
            ConstraintMaker.height.equalTo(44)
        }

        saveBtn.addTarget(self, action: #selector(saveAction), for: UIControl.Event.touchDown)
    }

    @objc func tapChooseGoodsSLTAction() {
        delegate?.tapChooseGoodsSLTAction()
    }

    @objc func tapChooseGoodsPicAction() {
        delegate?.tapChooseGoodsPicAction()
    }

    @objc func addGoodsDescrAction() {
        delegate?.tapAddGoodsDescrAction()
    }

    @objc func chooseCateAction() {
        delegate?.tapChooseCateAction()
    }

    @objc func chooseGoodsCateAction() {
        delegate?.tapChooseGoodsCateAction()
    }

    @objc func chooseTag1Action() {
        delegate?.tapChooseGoodsTagAction(tag:doorDeliveryTagBtn)
    }
    @objc func chooseTag2Action() {
        delegate?.tapChooseGoodsTagAction(tag:professionalInstallationTagBtn)
    }
    @objc func chooseTag3Action() {
        delegate?.tapChooseGoodsTagAction(tag:doorReturnTagBtn)
    }
    @objc func chooseTag4Action() {
        delegate?.tapChooseGoodsTagAction(tag:qualityAssuranceCommitmentTagBtn)
    }
    @objc func chooseTag5Action() {
        delegate?.tapChooseGoodsTagAction(tag:realThingReleasedTagBtn)
    }
    @objc func chooseTag6Action() {
        delegate?.tapChooseGoodsTagAction(tag:newPreferentialTagBtn)
    }
    @objc func chooseTag7Action() {
        delegate?.tapChooseGoodsTagAction(tag:restAssuredBuyTagBtn)
    }

    @objc func saveAction() {
        delegate?.tapSaveAction(name:goodsNameTF.text!,
                                unit:unitClassTF.text!,weight:weightTF.text!,
                                original_price:originalPriceTF.text!,price:goodsPriceTF.text!,
                                pieces:piecesDesrcTF.text!,
                                forehead:foreDesrcTF.text!,goods_num:amountTF.text!)
    }
    

}

extension UGoodsDetailView : UITextFieldDelegate {
    //MARK:进入编辑状态时触发
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "99999" {
            textField.text = "库存无限"
        }
    }
}


