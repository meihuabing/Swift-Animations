//
//  String+StringHeight.swift
//  StringHeight
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension String {
    
    /**
     Get the height with the string.
     
     - parameter attributes: The string attributes.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithStringAttributes(attributes : [String : AnyObject], fixedWidth : CGFloat) -> CGFloat {
        
        guard self.characters.count > 0 && fixedWidth > 0 else {
        
            return 0
        }
        
        let size = CGSizeMake(fixedWidth, CGFloat.max)
        let text = self as NSString
        let rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    func heightWithFont(font : UIFont = UIFont.systemFontOfSize(18), fixedWidth : CGFloat) -> CGFloat {
        
        guard self.characters.count > 0 && fixedWidth > 0 else {
            
            return 0
        }
        
        let size = CGSizeMake(fixedWidth, CGFloat.max)
        let text = self as NSString
        let rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the height with font.
     
     - parameter font:       The font.
     - parameter fixedWidth: The fixed width.
     
     - returns: The height.
     */
    static func HeightWithFont(font : UIFont = UIFont.systemFontOfSize(18)) -> CGFloat {
        
        let string = "One"
        let size   = CGSizeMake(200, CGFloat.max)
        let text   = string as NSString
        let rect   = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.height
    }
    
    /**
     Get the width with the string.
     
     - parameter attributes: The string attributes.
     
     - returns: The width.
     */
    func widthWithStringAttributes(attributes : [String : AnyObject]) -> CGFloat {
        
        guard self.characters.count > 0 else {
            
            return 0
        }
        
        let size = CGSizeMake(CGFloat.max, 0)
        let text = self as NSString
        let rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.width
    }
    
    /**
     Get the width with the string.
     
     - parameter font: The font.
     
     - returns: The string's width.
     */
    func widthWithFont(font : UIFont = UIFont.systemFontOfSize(18)) -> CGFloat {
        
        guard self.characters.count > 0 else {
            
            return 0
        }
        
        let size = CGSizeMake(CGFloat.max, 0)
        let text = self as NSString
        let rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
        
        return rect.size.width
    }
}



