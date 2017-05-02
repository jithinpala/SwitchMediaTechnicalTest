/*******************************************************************************************
 * File Name        :  ColorExtension.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  ColorExtension class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import Foundation
import UIKit

extension UIColor {
    
    
    
    /// Init color with RGB values
    ///
    /// - Parameter hex: hexColorValue
    convenience init(hex: Int) {
        
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        
        self.init(red:(CGFloat((netHex & 0xFF0000) >> 16) / CGFloat(255.0)), green:(CGFloat((netHex & 0xFF00) >> 8) / CGFloat(255.0)), blue:(CGFloat(netHex & 0xFF) / CGFloat(255.0)), alpha: 1.0)
        //self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    class func appThemeBlackColor() -> UIColor {
        return UIColor(red: 17.0/255.0, green: 17.0/255.0, blue: 17.0/255.0, alpha: 1)
    }
    
    class func appTableHeaderTitleColor() -> UIColor {
        return UIColor(red: 116.0/255.0, green: 116.0/255.0, blue: 116.0/255.0, alpha: 1)
    }
    
    class func appTableCellBackgroundColor() -> UIColor {
        return UIColor(red: 35.0/255.0, green: 35.0/255.0, blue: 35.0/255.0, alpha: 1)
    }
    
    class func appVideoCellSubtitleColor() -> UIColor {
        return UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1)
    }
    
    class func appNavBottomLineColor() -> UIColor {
        return UIColor(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 1)
    }
    
    class func appSelectedMenuColor() -> UIColor {
        return UIColor.white
    }
    
    class func appUnselectedMenuColor() -> UIColor {
        return UIColor(red: 139.0/255.0, green: 139.0/255.0, blue: 139.0/255.0, alpha: 1)
    }
    
    class func appKidsMenuBackColor() -> UIColor {
        return UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
    }
    
    class func appMenuBottomBarColor() -> UIColor {
        return UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1)
    }
    
    class func appVideoProgressBarColor() -> UIColor {
        return UIColor(red: 218.0/255.0, green: 77.0/255.0, blue: 45.0/255.0, alpha: 1)
    }
    
    
    
    
    //    /// Init color with RGB values
    //    ///
    //    /// - Parameter hexString: hex String
    //    convenience init(hexString:String) {
    //        let hexString:NSString = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    //        let scanner            = NSScanner(string: hexString as String)
    //
    //        if (hexString.hasPrefix("#")) {
    //            scanner.scanLocation = 1
    //        }
    //
    //        var color:UInt32 = 0
    //        scanner.scanHexInt(&color)
    //
    //        let mask = 0x000000FF
    //        let r = Int(color >> 16) & mask
    //        let g = Int(color >> 8) & mask
    //        let b = Int(color) & mask
    //
    //        let red   = CGFloat(r) / 255.0
    //        let green = CGFloat(g) / 255.0
    //        let blue  = CGFloat(b) / 255.0
    //
    //        self.init(red:red, green:green, blue:blue, alpha:1)
    //    }
    
    /*******************************************************************************************
     * Description      :  getting purple color
     * Parameters       :  Nil
     * Return           :  purple color
     *******************************************************************************************/
    
    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    class func bblPurpleColor() -> UIColor{
        return UIColor(hex: 0x7646d3)
    }
    
    /*******************************************************************************************
     * Description      :  getting text color
     * Parameters       :  Nil
     * Return           :  text color
     *******************************************************************************************/
    class func bblTextColor() -> UIColor {
        return UIColor(hex: 0x525252)
    }
    
    /*******************************************************************************************
     * Description      :  getting selected background color
     * Parameters       :  Nil
     * Return           :  selected background color
     *******************************************************************************************/
    class func selectedCatagoryBGColor() -> UIColor {
        
        return UIColor(red: 212/255.0, green: 212/255.0, blue: 212/255.0, alpha: 1)
    }
    /*******************************************************************************************
     * Description      :  getting arrow background color
     * Parameters       :  Nil
     * Return           :  arrow background color
     *******************************************************************************************/
    class func arrowBGColor() -> UIColor {
        
        return UIColor(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
    }
    
    
    /// Init RGB Values
    ///
    /// - Returns: red:Int, green:Int, blue:Int, alpha:Int
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
    //    convenience init(red: Int, green: Int, blue: Int) {
    //        assert(red >= 0 && red <= 255, "Invalid red component")
    //        assert(green >= 0 && green <= 255, "Invalid green component")
    //        assert(blue >= 0 && blue <= 255, "Invalid blue component")
    //
    //        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    //    }
    //    convenience init(hexValue:Int) {
    //        self.init(red:(hexValue >> 16) & 0xff, green:(hexValue >> 8) & 0xff, blue:hexValue & 0xff)
    //    }
    
    /*******************************************************************************************
     * Description      :  Theme Color
     * Parameters       :  red:Int, green:Int, blue:Int, alpha:Int
     * Return           :  Nil
     *******************************************************************************************/
    
    class func themeColor()  -> UIColor {
        return UIColor(red: 130/255, green: 36/255, blue: 227/255, alpha: 1)
    }
    
}
