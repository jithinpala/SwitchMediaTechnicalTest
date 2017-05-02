/*******************************************************************************************
 * File Name        :  HomeMenuBar.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  HomeMenuBar class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit
import Foundation

protocol HomeMenuBarDelegate {
    func menuButtonTapAction(buttonIndex: Int)
}

class HomeMenuBar: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var liveButton: UIButton!
    @IBOutlet weak var anytimeButton: UIButton!
    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var menuBottomBar: UIView!
    @IBOutlet weak var buttonBottomBar: UIView!
    @IBOutlet weak var widthConstraints: NSLayoutConstraint!
    @IBOutlet weak var orginXConstraints: NSLayoutConstraint!
    
    
    // MARK: - Variables
    var delegate: HomeMenuBarDelegate?
    var gradient: CAGradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.appThemeBlackColor()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {        
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.appThemeBlackColor()
        
    }
    
    func initialization() {
        
        // Menu title
        homeButton.setTitle("menu.title.home".localized(), for: .normal)
        liveButton.setTitle("menu.title.live".localized(), for: .normal)
        anytimeButton.setTitle("menu.title.anytime".localized(), for: .normal)
        kidsButton.setTitle("menu.title.kids".localized(), for: .normal)
        playerButton.setTitle("menu.title.player".localized(), for: .normal)        
        
        
        // Menu text color
        menuBottomBar.backgroundColor = UIColor.appMenuBottomBarColor()
        homeButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
        liveButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
        anytimeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
        kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
        playerButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
        
        // Change background of Kids button.
        kidsButton.backgroundColor = UIColor.appKidsMenuBackColor()
        kidsButton.layer.cornerRadius = 12.0
        kidsButton.layer.masksToBounds = true
        buttonBottomBar.frame.origin.x = homeButton.frame.origin.x
        
        createGradientColorForBar(gradientWidth: homeButton.frame.size.width)
        
    }
    
    @IBAction func menuButtonTapEvent(sender: UIButton) {
        changeSelectedMenuTextColor(selectedTag: sender.tag)
        delegate?.menuButtonTapAction(buttonIndex: sender.tag)
        
    }
    
    func changeSelectedMenuTextColor(selectedTag: Int) {
        switch selectedTag {
        case 100:
            homeButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            liveButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            anytimeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            playerButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            animationChangeForMenuBottonBar(selectedButton: homeButton)
            break
        case 200:
            homeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            liveButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            anytimeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            playerButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            animationChangeForMenuBottonBar(selectedButton: liveButton)
            break
        case 300:
            homeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            liveButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            anytimeButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            playerButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            animationChangeForMenuBottonBar(selectedButton: anytimeButton)
            break
        case 400:
            homeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            liveButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            anytimeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            playerButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            animationChangeForMenuBottonBar(selectedButton: kidsButton)
            break
        case 500:
            homeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            liveButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            anytimeButton.setTitleColor(UIColor.appUnselectedMenuColor(), for: .normal)
            kidsButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            playerButton.setTitleColor(UIColor.appSelectedMenuColor(), for: .normal)
            animationChangeForMenuBottonBar(selectedButton: playerButton)
            break
        default:
            break
        }
    }
    
    /// Menu button bottom bar animation
    ///
    /// - Parameter selectedButton: user clicked UIButton
    func animationChangeForMenuBottonBar(selectedButton: UIButton) {

        self.widthConstraints.constant = selectedButton.frame.size.width
        self.orginXConstraints.constant = selectedButton.frame.origin.x
        createGradientColorForBar(gradientWidth: selectedButton.frame.size.width)
        buttonBottomBar.setNeedsUpdateConstraints()
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    /// Create gradient color
    func createGradientColorForBar(gradientWidth: CGFloat) {
        //gradient = CAGradientLayer()
        gradient.removeFromSuperlayer()
        gradient.frame = CGRect(x: 0, y: 0, width: gradientWidth, height: 2)        
        gradient.colors = [UIColor(red: 207.0/255.0, green: 65.0/255.0, blue: 51.0/255.0, alpha: 1).cgColor,UIColor(red: 234.0/255.0, green: 97.0/255.0, blue: 31.0/255.0, alpha: 1).cgColor]
        buttonBottomBar.layer.addSublayer(gradient)
        
        
    }

}
