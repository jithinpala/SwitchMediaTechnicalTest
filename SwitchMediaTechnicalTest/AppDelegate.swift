/*******************************************************************************************
 * File Name        :  AppDelegate.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  AppDelegate class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appController = AppController()


    /*******************************************************************************************
     * Description      :  Launching  application. initialize application, Facebook sdk and Braintree payment
     * Parameters       :  application : UIApplication, launchOptions : launch options
     * Return           :  returns true or false
     *******************************************************************************************/
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    /*******************************************************************************************
     * Description      :  Called when the application is about to move from active to inactive state
     * Parameters       :  application : UIApplication
     * Return           :  Nil
     *******************************************************************************************/
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    /*******************************************************************************************
     * Description      :  Called when the application enter in background state
     * Parameters       :  application : UIApplication
     * Return           :  Nil
     *******************************************************************************************/
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    /*******************************************************************************************
     * Description      :  Called when the application enter foreground state from background
     * Parameters       :  application : UIApplication
     * Return           :  Nil
     *******************************************************************************************/
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    /*******************************************************************************************
     * Description      :  Called when the application become active from inactive state. Called facebook sdk delegate method
     * Parameters       :  application : UIApplication
     * Return           :  Nil
     *******************************************************************************************/
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    /*******************************************************************************************
     * Description      :  Called when the application is about to terminate
     * Parameters       :  application : UIApplication
     * Return           :  Nil
     *******************************************************************************************/
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

