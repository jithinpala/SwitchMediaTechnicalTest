//
//  VideoTableViewCell.swift
//  SwitchMediaTechnicalTest
//
//  Created by Jithin on 1/5/17.
//  Copyright © 2017 Jithinpala. All rights reserved.
//

import UIKit
import Foundation

protocol VideoTableViewCellDelegate {
    func userClickEventOnCollectionViewCell(tableViewSession: Int, collectionCellIndexpath: IndexPath, cellImage: UIImage)
}

class VideoTableViewCell: UITableViewCell {
    
    // MARK: - Outlest
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var showProgressBarBool: Bool = false
    var currentTableSession: Int = 0
    var cellDelegate: VideoTableViewCellDelegate?
    var urlItemList: SMVideoItems!
    var channelList = [Any]()
    var watchList = [Any]()
    var highlightList = [Any]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initialize()
    }
    
    func initialize() {
        //self.backgroundColor = UIColor.appTableCellBackgroundColor()
    }
    
    func updateVideoCell(indexPath: IndexPath) {
        
        currentTableSession = indexPath.section
        if indexPath.section == 1 {
            showProgressBarBool = true
        } else {
            showProgressBarBool = false
        }
        
    }
    
    func updateFetchedImageUrls(items: SMVideoItems!) {
        urlItemList = items
        let arrayList = items.contentItems 
        createAllChannelList(arrayList: arrayList)
        collectionView.reloadData()
    }
    
    func createAllChannelList(arrayList: NSMutableArray) {
        channelList     = arrayList.subarray(with: NSRange(location: 0, length: 8))
        watchList       = arrayList.subarray(with: NSRange(location: 8, length: 5))
        highlightList   = arrayList.subarray(with: NSRange(location: 12, length: 4))
        return
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension VideoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch currentTableSession {
        case 0:
            return 8
        case 1:
            return 5
        case 2:
            return 4
        default:
            return 4
        }        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VideoCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        cell.initialize(progressBool: showProgressBarBool)
        switch currentTableSession {
        case 0:
            if channelList.count > 0 {
                let singleItem = channelList[indexPath.row] as! SMTileUrlItem
                cell.videoSubtitle.text = singleItem.channelName
                Helper.sharedInstance.downloadImageFrom(link: singleItem.imageUrl!, with: cell.videoThumnailImageView)
            }
            break
        case 1:
            if watchList.count > 0 {
                let singleItem = watchList[indexPath.row] as! SMTileUrlItem
                cell.videoSubtitle.text = singleItem.channelName
                //let interValue = Helper.sharedInstance.generateRandomNumberWith(limit: 85)
                //print( interValue / 100)
                //let percentage = Float( interValue / 100)
                let percentage = Helper.sharedInstance.randomPercentage().floatValue
                cell.showVideoWatchedProgresBar(progress: percentage)
                Helper.sharedInstance.downloadImageFrom(link: singleItem.imageUrl!, with: cell.videoThumnailImageView)
            }
            break
        case 2:
            if highlightList.count > 0 {
                let singleItem = highlightList[indexPath.row] as! SMTileUrlItem
                cell.videoSubtitle.text = singleItem.channelName
                Helper.sharedInstance.downloadImageFrom(link: singleItem.imageUrl!, with: cell.videoThumnailImageView)
            }
            break
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! VideoCollectionCell
        let cellImage = cell.videoThumnailImageView.image
        cellDelegate?.userClickEventOnCollectionViewCell(tableViewSession: currentTableSession, collectionCellIndexpath: indexPath, cellImage: cellImage!)        
    }
    
}

extension VideoTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch currentTableSession {
        case 0:
            return CGSize(width: 150, height: 120)
        case 1:
            return CGSize(width: 220, height: 176)
        case 2:
            return CGSize(width: 185, height: 148)
        default:
            return CGSize(width: 150, height: 120)
        }
        
    }
    
}
