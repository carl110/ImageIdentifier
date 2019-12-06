//
//  String+extensions.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

    extension NSMutableAttributedString {

        func setColorForText(textForAttribute: String, withColor color: UIColor) {
            let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

            self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)

        }
        
        func stroke(font: UIFont?, strokeWidth: Float?, insideColor: UIColor?, strokeColor: UIColor?, backgroundColor: UIColor?) -> [NSAttributedString.Key: Any]{
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            return [
                NSAttributedString.Key.strokeColor : strokeColor ?? UIColor.Shades.standardBlack,
                NSAttributedString.Key.foregroundColor : insideColor ?? UIColor.Shades.standardBlack,
                NSAttributedString.Key.strokeWidth : -(strokeWidth ?? 0),
                NSAttributedString.Key.font : font ?? UIFont.smallSystemFontSize,
                NSAttributedString.Key.backgroundColor : backgroundColor ?? UIColor.clear,
                NSAttributedString.Key.paragraphStyle : paragraphStyle
                ]
        }

}




//let paragraphStyle = NSMutableParagraphStyle()
//paragraphStyle.alignment = .center
//
//let predTitleTextAttributes = [NSAttributedString.Key.backgroundColor: UIColor.Shades.standardGrey,
//                      NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
//                      NSAttributedString.Key.paragraphStyle: paragraphStyle] as [NSAttributedString.Key : Any]
