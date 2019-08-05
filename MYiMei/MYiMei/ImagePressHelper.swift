//
//  ImagePressHelper.swift
//  MYiMei
//
//  Created by 符宏梁 on 2019/7/9.
//  Copyright © 2019 符宏梁. All rights reserved.
//

import UIKit

class ImagePressHelper: NSObject {

    //图片压缩 1000kb以下的图片控制在100kb-200kb之间
    func compressImageSize(image:UIImage) -> Data{
        var zipImageData = image.jpegData(compressionQuality: 1.0)
        let originalImgSize = zipImageData!.count/1024 as Int  //获取图片大小
        print("原始大小: \(originalImgSize)")

        if originalImgSize>1500 {
            zipImageData = image.jpegData(compressionQuality: 0.1)
        }else if originalImgSize>600 {
            zipImageData = image.jpegData(compressionQuality: 0.2)
        }else if originalImgSize>400 {
            zipImageData = image.jpegData(compressionQuality: 0.3)
        }else if originalImgSize>300 {
            zipImageData = image.jpegData(compressionQuality: 0.4)
        }else if originalImgSize>200 {
            zipImageData = image.jpegData(compressionQuality: 0.5)
        }
        return zipImageData!
    }

    func resizeImage(originalImg:UIImage) -> UIImage{

        //prepare constants
        let width = originalImg.size.width
        let height = originalImg.size.height
        let scale = width/height

        var sizeChange = CGSize()

        if width <= 800 && height <= 800{ //a，图片宽或者高均小于或等于800时图片尺寸保持不变，不改变图片大小
            return originalImg
        }else if width > 800 || height > 800 {//b,宽或者高大于1280，但是图片宽度高度比小于或等于2，则将图片宽或者高取大的等比压缩至800

            if scale <= 2 && scale >= 1 {
                let changedWidth:CGFloat = 800
                let changedheight:CGFloat = changedWidth / scale
                sizeChange = CGSize(width: changedWidth, height: changedheight)

            }else if scale >= 0.5 && scale <= 1 {

                let changedheight:CGFloat = 800
                let changedWidth:CGFloat = changedheight * scale
                sizeChange = CGSize(width: changedWidth, height: changedheight)

            }else if width > 800 && height > 800 {//宽以及高均大于800，但是图片宽高比大于2时，则宽或者高取小的等比压缩至800

                if scale > 2 {//高的值比较小

                    let changedheight:CGFloat = 800
                    let changedWidth:CGFloat = changedheight * scale
                    sizeChange = CGSize(width: changedWidth, height: changedheight)

                }else if scale < 0.5{//宽的值比较小

                    let changedWidth:CGFloat = 800
                    let changedheight:CGFloat = changedWidth / scale
                    sizeChange = CGSize(width: changedWidth, height: changedheight)

                }
            }else {//d, 宽或者高，只有一个大于800，并且宽高比超过2，不改变图片大小
                return originalImg
            }
        }

        UIGraphicsBeginImageContext(sizeChange)

        //draw resized image on Context
        originalImg.draw(in: CGRect(x: 0, y: 0, width: sizeChange.width, height: sizeChange.height))

        //create UIImage
        let resizedImg = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return resizedImg!

    }
    
}
