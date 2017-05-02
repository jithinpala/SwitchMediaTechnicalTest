/*******************************************************************************************
 * File Name        :  AppController.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  AppController class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit

class AppController: NSObject {    
    
    
    /// Loading Home viewController
    ///
    /// - Returns: UIViewController
    func loadHomeViewController() -> UIViewController {
        
        let storyBoard = Helper.sharedInstance.getStoryBoardWithName(name: "Main")
        let viewcontroller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
        return viewcontroller
    }
    
    
    /// Loading Video detail viewController
    ///
    /// - Parameters:
    ///   - tileImage: Tile image
    ///   - currentViewController: UIViewController
    func loadVideoDetailViewController(tileImage: UIImage, currentViewController: UIViewController) {
        
        let storyBoard = Helper.sharedInstance.getStoryBoardWithName(name: "Main")
        let viewcontroller: VideoDetailViewController = storyBoard.instantiateViewController(withIdentifier: "VideoDetailViewController") as! VideoDetailViewController
        viewcontroller.placeHolderImage = tileImage
        currentViewController.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    

}
