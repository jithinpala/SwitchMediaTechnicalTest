/*******************************************************************************************
 * File Name        :  VideoDetailViewController.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  VideoDetailViewController class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit
import Foundation
import AVKit
import AVFoundation


class VideoDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var videoThumbImageView: UIImageView!
    @IBOutlet weak var backArrowButton: UIButton!
    @IBOutlet weak var playVideoButton: UIButton!
    
    
    // MARK: - Variables
    
    var placeHolderImage: UIImage!
    var player: AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Initialize user interface
        initializeUserInterface()
    }
    
    func initializeUserInterface() {
        self.view.backgroundColor = UIColor.appThemeBlackColor()
        videoThumbImageView.image = placeHolderImage
    }
    
    @IBAction func backArrowButtonTapEvent(sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func videoPlayButtonTapEvent(sender: UIButton) {
        
        guard Helper.sharedInstance.isReachable else {
            
            JBAlertViewController.sharedInstance.showAlertWithYesAndNowithReturn(titleString: "SM Test", messageString: "alert.internet.warning.setting".localized(), okButtonTitle: "Yes", noButtonTitle: "No", viewController: self, completionHandler: { (index) in
                if index == 1 {
                    guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                        return
                    }
                    guard Helper.sharedInstance.getApplication().canOpenURL(settingsUrl) else {
                        return
                    }
                    
                    Helper.sharedInstance.getApplication().openURL(settingsUrl)
                    
                }
            })
            return
        }
        playVideoFromUrl()           
        
    }
    
    func playVideoFromUrl() {
        if let play = player {
            play.play()
        } else {
            let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.showsPlaybackControls = true
            playerViewController.player = player
            playerViewController.delegate = self
            self.present(playerViewController, animated: true) {
                playerViewController.player?.play()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension VideoDetailViewController: AVPlayerViewControllerDelegate {
    
    func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("WillStopPictureInPicture")
    }
    
    func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("DidStopPictureInPicture")
    }
    
}


