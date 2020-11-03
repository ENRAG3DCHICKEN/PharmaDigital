//
//  UIColor+AppTheme.swift
//  TemplateApp
//
//  Created by ENRAG3DCHICKEN on 2020-09-29.
//  Copyright © 2020 ENRAG3DCHICKEN. All rights reserved.
//

import SwiftUI

extension Color {
 init(_ rgb: UIColor.RGB) {
 self.init(UIColor(rgb))
 }
}
extension UIColor {
 public struct RGB: Hashable, Codable {
 var red: CGFloat
 var green: CGFloat
 var blue: CGFloat
 var alpha: CGFloat
 }

 convenience init(_ rgb: RGB) {
 self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: rgb.alpha)
 }

 public var rgb: RGB {
 var red: CGFloat = 0
 var green: CGFloat = 0
 var blue: CGFloat = 0
 var alpha: CGFloat = 0
 getRed(&red, green: &green, blue: &blue, alpha: &alpha)
 return RGB(red: red, green: green, blue: blue, alpha: alpha)
 }
}


extension UIColor {
        static var mainColor: UIColor { return UIColor(red: 44/255, green: 94/255, blue: 54/255, alpha: 1) }
        static var lightGreen: UIColor { return UIColor(red: 12/255, green: 129/255, blue: 0/255, alpha: 1) }
    }
    
