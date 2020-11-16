//
//  UiColor+Utils.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 27/10/2020.
//

import UIKit

extension UIColor {
    convenience init(red: UInt8, green: UInt8, blue: UInt8) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex: Int) {
        let red = UInt8((netHex >> 16) & 0xff)
        let green = UInt8((netHex >> 8) & 0xff)
        let blue = UInt8(netHex & 0xff)
        self.init(red: red, green: green, blue: blue)
    }
}
