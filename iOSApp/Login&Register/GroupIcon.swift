//
//  GroupIcon.swift
//  Login&Register
//
//  Created by 骧小爷 on 2017/2/28.
//  Copyright © 2017年 骧小爷. All rights reserved.
//

import UIKit


    extension UIImage {
        
        //generate group Icon
        class func groupIcon(wh:CGFloat, images:[UIImage], bgColor:UIColor?) -> UIImage {
            let IconSize = CGSize(width:wh, height:wh)
            var rect: CGRect = CGRect.zero
            rect.size = IconSize
            
            //Image context process
            UIGraphicsBeginImageContextWithOptions(IconSize, false, 0)
            
            //Images inside
            if images.count >= 1 {
                //assign position of each image
                var rects = self.getRectsInGroupIcon(wh:wh, count:images.count)
                var count = 0
                //map each image to position
                for image in images {
                    if count > rects.count-1 {
                        break
                    }
                    
                    let rect = rects[count]
                    image.draw(in: rect)
                    count = count + 1
                }
            }
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!
        }
        
        
        //assigin position
        class func getRectsInGroupIcon(wh:CGFloat, count:Int) -> [CGRect] {
            //one image
            if count == 1 {
                return [CGRect(x:0, y:0, width:wh, height:wh)]
            }
            
            //image > 1
            var array = [CGRect]()
            //image intervel
            var space: CGFloat = 10
            //image size
            var imgSize: CGFloat
            //cell number(not same with image number;count<4,cell number =4; count >4 cel number=9）
            var cellCount:Int
            
            if count <= 4 {
                imgSize = (wh-space*3)/2
                cellCount = 4
            } else {
                space = space/2
                imgSize = (wh-space*4)/3
                cellCount = 9
            }
            
            //whole rows
            let rowCount = Int(sqrt(Double(cellCount)))//exctraction of root
            
            for i in 0..<cellCount {
                //row
                let row = i/rowCount
                //column
                let column = i%rowCount
                let rect = CGRect(x:space*CGFloat(column+1)+imgSize*CGFloat(column),
                                  y:space*CGFloat(row+1)+imgSize*CGFloat(row),
                                  width:imgSize, height:imgSize)
                array.append(rect)
            }
            
            return array
        }
    }

