/*******************************************************************************************
 * File Name        :  RootViewController.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  RootViewController class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit
import Foundation

class RootViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var homeNavController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.warningLabel.text = ""
        
    }    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard Helper.sharedInstance.isReachable else {
            
            //JBAlertViewController.sharedInstance.showSimpleAlertWithYesButton(titleString: "SM Test", messageString: "alert.internet.warning".localized(), buttonTitle: "Yes", viewController: self)
            JBAlertViewController.sharedInstance.showAlertWithYesWithReturn(titleString: "SM Test", messageString: "alert.internet.warning".localized(), okButtonTitle: "OK", viewController: self) { (buttonIndex) in
                if buttonIndex == 1 {
                    self.warningLabel.text = "Please check your internet connection."
                }
            }
            return
        }
        showHomeScreen()    
        
    }
    
    /// Show home screen
    func showHomeScreen() {
        let homeViewController = Helper.sharedInstance.getAppController().loadHomeViewController()
        homeNavController = UINavigationController(rootViewController: homeViewController)
        homeNavController!.setNavigationBarHidden(true, animated: false)
        self.view.addSubview(homeNavController!.view)
        self.addChildViewController(homeNavController!)
        homeNavController!.didMove(toParentViewController: self)
    }    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
