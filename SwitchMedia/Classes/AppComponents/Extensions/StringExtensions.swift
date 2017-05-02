/*******************************************************************************************
 * File Name        :  StringExtensions.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  StringExtensions class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import Foundation
import UIKit

extension String {
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}
