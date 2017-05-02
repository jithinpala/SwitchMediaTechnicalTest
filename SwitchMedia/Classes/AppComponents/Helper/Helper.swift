/*******************************************************************************************
 * File Name        :  Helper.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  Helper class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit

class Helper: NSObject {
    
    static let sharedInstance = Helper()
    
    var isReachable: Bool {
        if let reachability =  Reachability()?.currentReachabilityStatus{
            return reachability != .notReachable
        }
        return false
    }
    
    /// This method returns the app controller.
    ///
    /// - Returns: AppController
    func getAppController()-> AppController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.appController
    }
    
    
    /// This method returns the singleton app instance.
    ///
    /// - Returns: The singleton app instance as UIApplication
    func getApplication()-> UIApplication {
        return UIApplication.shared
    }   
    
    
    /// Returns storyboard with specified name.
    ///
    /// - Parameter name: Name of storyboard.
    /// - Returns: Returns storyboard
    func getStoryBoardWithName(name:String)-> UIStoryboard{
        let storyBoard = UIStoryboard(name: name, bundle: nil)
        return storyBoard
    }
    
    func generateRandomNumber() -> String {
        
        let randomNum:UInt32 = arc4random_uniform(100) // range is 0 to 99
        // convert the UInt32 to some other  types
        //let randomTime:TimeInterval = TimeInterval(randomNum)
        //let someInt:Int = Int(randomNum)
        let randomString:String = String(randomNum) //string works too
        return randomString
    }
    
    func generateRandomNumberWith(limit range: Int) -> Int {
        
        let randomNum:UInt32 = arc4random_uniform(UInt32(range)) // range is 0 to 99
        // convert the UInt32 to some other  types
        //let randomTime:TimeInterval = TimeInterval(randomNum)
        let someInt:Int = Int(randomNum)
        //let randomString:String = String(randomNum) //string works too
        return someInt
    }
    
    func downloadImageFrom(link: String, with imageView: UIImageView) {
        let url = URL(string: link)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                if let imageData = data {
                    imageView.image = UIImage(data: imageData)
                }
            }
        }).resume()
        
    }
    
    func showNetworkIndicatorWith(visibility: Bool) {
        getApplication().isNetworkActivityIndicatorVisible = visibility
    }
    
    func randomPercentage() -> String {
        let array = ["0.30", "0.45", "0.80", "0.50", "0.70","0.36","0.62"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        return array[randomIndex]
    }
    
    

}


