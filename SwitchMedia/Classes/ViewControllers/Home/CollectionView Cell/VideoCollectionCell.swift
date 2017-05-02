//
//  VideoCollectionCell.swift
//  SwitchMediaTechnicalTest
//
//  Created by Jithin on 1/5/17.
//  Copyright © 2017 Jithinpala. All rights reserved.
//

import UIKit

class VideoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var videoThumnailImageView: UIImageView!
    @IBOutlet weak var videoSubtitle: UILabel!
    @IBOutlet weak var videoInfoButton: UIButton!
    @IBOutlet weak var videoPlayButton: UIButton!
    @IBOutlet weak var videoProgressBar: UIView!
    @IBOutlet weak var videoProgressView: UIProgressView!
    
    func initialize(progressBool: Bool = false) {
        videoProgressBar.isHidden = !progressBool
        self.backgroundColor = UIColor.appTableCellBackgroundColor()
        videoSubtitle.textColor = UIColor.appVideoCellSubtitleColor()
    }
    
    func showVideoWatchedProgresBar(progress: Float) {
        videoProgressView.progress = progress
        videoProgressView.trackTintColor = UIColor.black
        videoProgressView.progressTintColor = UIColor.appVideoProgressBarColor()
        
    }
    
}
