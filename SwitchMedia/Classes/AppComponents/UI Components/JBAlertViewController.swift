/*******************************************************************************************
 * File Name        :  JBAlertViewController.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  JBAlertViewController class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit
import Foundation

class JBAlertViewController: NSObject {
    
    static let sharedInstance = JBAlertViewController()
    
    func showSimpleAlertWithYesButton(titleString: String, messageString: String, buttonTitle: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { (result: UIAlertAction) in
            print("")
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
    func showSimpleAlertWithYesAndNo(titleString: String, messageString: String, okButtonTitle: String, noButtonTitle: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { (result: UIAlertAction) in
            print("")
        }
        
        let noAction = UIAlertAction(title: noButtonTitle, style: .cancel) { (result: UIAlertAction) in
            print("")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(noAction)
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlertWithYesAndNowithReturn(titleString: String, messageString: String, okButtonTitle: String, noButtonTitle: String, viewController: UIViewController, completionHandler: @escaping (_ buttonIndex: Int) -> Void) {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { (result: UIAlertAction) in
            completionHandler(1)
        }
        
        let noAction = UIAlertAction(title: noButtonTitle, style: .cancel) { (result: UIAlertAction) in
            completionHandler(2)
        }
        
        alertController.addAction(okAction)
        alertController.addAction(noAction)
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
    func showAlertWithYesWithReturn(titleString: String, messageString: String, okButtonTitle: String, viewController: UIViewController, completionHandler: @escaping (_ buttonIndex: Int) -> Void) {
        
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { (result: UIAlertAction) in
            completionHandler(1)
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
        
    }
    
    

}
