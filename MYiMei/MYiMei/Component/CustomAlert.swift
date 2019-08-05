//
//  CustomAlert.swift
//  MYiMei
//
//  Created by 于亿鑫 on 2019/7/11.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit
//import Spring

class CustomAlert: UIView {
    /// 根据RGBA生成颜色(格式为：22,22,22,0.5)
    var SM_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
    }
    
    typealias clickAlertClosure = (_ index: Int) -> Void //声明闭包，点击按钮传值
    //把申明的闭包设置成属性
    var clickClosure: clickAlertClosure?
    //为闭包设置调用函数
    func clickIndexClosure(_ closure:clickAlertClosure?){
        //将函数指针赋值给myClosure闭包
        clickClosure = closure
    }
    
    
    let Screen_width = UIScreen.main.bounds.size.width
    let Screen_height = UIScreen.main.bounds.size.height
//    let bgView = SpringView() //白色框动画控件
    let bgView = UIView() //白色框
    let titleLabel = UILabel() //标题按钮
    let contentLabel = UILabel() //显示内容
    
    var title = "" //标题
    var content = "" //内容
    let cancelBtn = UIButton() //取消按钮
    let sureBtn = UIButton() //确定按钮
    let Bgtap = UITapGestureRecognizer() //点击手势
    
    
    let scrollview = UIScrollView() //滚动视图层
    
    //MARK:---YYX定义---
    let cancleImg = UIImageView() //右上角取消的图片
    let tipGoodsLabel = UILabel() // 商品价格输入框上面的提示
    let goodsLabel = UILabel() //商品价格
    let inputGoodsPriceTF = UITextField() //商品价格输入框
    let tipFreightLabel = UILabel() // 运费价格输入框上面的提示
    let freightLabel = UILabel() //运费价格
    let inputFreightPriceTF = UITextField() //运费价格输入框
    
    let warmLabel = UILabel() //红色文字的警告
    
    init(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?) {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen_width, height: Screen_height))
        createAlertView()
        self.titleLabel.text = title
        
        /**设置 UILable的行间距 **/
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = 10
        //样式属性集合
        let attributes = [kCTFontAttributeName:UIFont.systemFont(ofSize: 15),
                          kCTParagraphStyleAttributeName: paraph]
        self.contentLabel.attributedText = NSAttributedString(string: message!, attributes: attributes as [NSAttributedString.Key : Any])
        //self.contentLabel.text = message
        
        
        self.cancelBtn.setTitle(cancelButtonTitle, for: .normal)
        self.sureBtn.setTitle(sureButtonTitle, for: .normal)
    }
    
    //MARK:创建
    func createAlertView() {
        //布局
        self.frame = CGRect(x: 0, y: 0, width: Screen_width, height: Screen_height)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        Bgtap.addTarget(self, action: #selector(dismiss))
        self.addGestureRecognizer(Bgtap)
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: 30, y: Screen_height/2 - 250, width: Screen_width - 60, height: 420)//设置大小及其位置
        bgView.backgroundColor = UIColor.white//背景色
        bgView.layer.cornerRadius = 9
        bgView.clipsToBounds = true
        
//        bgView.animation = "pop"
//        bgView.curve = "Spring"
//        bgView.duration = 1.0
//        bgView.damping = 0.7
//        bgView.velocity = 0.7
//        bgView.force = 0.3
//        bgView.animate()
        
        self.addSubview(bgView)
        let width = bgView.frame.size.width
        let height = bgView.frame.size.height
        //标题
        titleLabel.frame = CGRect(x: 0, y: 25, width: width, height: 40)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        bgView.addSubview(titleLabel)
        
        //
        
        cancleImg.image = UIImage.init(named: "add_photo")
        bgView.addSubview(cancleImg)
        cancleImg.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.width.height.equalTo(15)
            ConstraintMaker.top.equalToSuperview().offset(16)
            ConstraintMaker.right.equalToSuperview().offset(-16)
        }
        
        inputGoodsPriceTF.textColor = UIColor.black
        
        
        goodsLabel.text = "修改订单中所有商品的总价格"
        goodsLabel.font = UIFont.systemFont(ofSize: 15)
        goodsLabel.textColor = UIColor.black
        bgView.addSubview(goodsLabel)
        goodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(tipGoodsLabel.snp.bottom).offset(24)
        }
        
        tipGoodsLabel.text = "商品价格："
        tipGoodsLabel.font = UIFont.systemFont(ofSize: 15)
        tipGoodsLabel.textColor = UIColor.hex(hexString: "#808080")
        bgView.addSubview(tipGoodsLabel)
        tipGoodsLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15)
            ConstraintMaker.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        //滚动视图层
        scrollview.frame = CGRect(x: 24, y: 30, width: width, height: height - 70)
        bgView.addSubview(scrollview)
        
        //内容
        //contentLabel.frame = CGRect(x: 24, y: 56, width: width - 48, height: 68)
        let scrollHeight = scrollview.frame.size.height
        contentLabel.frame = CGRect(x: 0, y: 0, width:width - 48, height: scrollHeight)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 17)
        scrollview.addSubview(contentLabel)
        //取消按钮
        let btnWith = (width - 30) / 2
        cancelBtn.frame = CGRect(x: 10, y: scrollHeight + 20, width: btnWith, height: 45)
        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
        //确认按钮
        sureBtn.frame = CGRect(x: btnWith + 20 , y: scrollHeight + 20, width: btnWith, height: 45)
        sureBtn.backgroundColor = UIColor.yellow
        sureBtn.setTitleColor(UIColor.black, for: UIControl.State())
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        sureBtn.layer.cornerRadius = 3
        sureBtn.clipsToBounds = true
        sureBtn.tag = 2
        sureBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
        bgView.addSubview(sureBtn)
    }
    
    //MARK:按键的对应的方法
    @objc func clickBtnAction(_ sender: UIButton) {
        if (clickClosure != nil) {
            clickClosure!(sender.tag)
        }
        dismiss()
    }
    //MARK:消失
    @objc func dismiss() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.bgView.alpha = 0
            self.alpha = 0
        }, completion: { (finish) -> Void in
            if finish {
                self.removeFromSuperview()
            }
        })
    }
    /** 指定视图实现方法 */
    func show() {
        let wind = UIApplication.shared.keyWindow
        self.alpha = 0
        
        wind?.addSubview(self)
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.alpha = 1
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
