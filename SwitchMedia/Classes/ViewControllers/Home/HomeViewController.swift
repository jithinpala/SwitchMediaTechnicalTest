/*******************************************************************************************
 * File Name        :  HomeViewController.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  HomeViewController class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBar: HomeMenuBar!
    
    // MARK: - Variables
    
    var xmlParser: JBXMLParser!
    var tileItems: SMVideoItems?
    var currentMenuIndex: Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Initialize user interface
        initializeUserInterface()
        startXMLParsingWithMenu(menuIndex: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeUserInterface() {
        self.view.backgroundColor = UIColor.appThemeBlackColor()
        menuBar.delegate = self
        menuBar.initialization()
    }
    
    func startXMLParsingWithMenu(menuIndex: Int) {
        // Run xml parsing in background thread
        Helper.sharedInstance.showNetworkIndicatorWith(visibility: true)
        var API_URL: String!
        switch menuIndex {
        case 100:
            API_URL = API_FOR_HOME
            currentMenuIndex = 100
            break
        case 200:
            API_URL = API_FOR_LIVETV
            currentMenuIndex = 200
            break
        case 300:
            API_URL = API_FOR_ANYTIME
            currentMenuIndex = 300
            break
        case 400:
            API_URL = API_FOR_KIDS
            currentMenuIndex = 400
            break
        case 500:
            API_URL = API_FOR_HOME
            currentMenuIndex = 500
            break
        default:
            API_URL = API_FOR_HOME
            break
        }
        DispatchQueue.global(qos: .background).async {
            let url = NSURL(string: API_URL)
            self.xmlParser = JBXMLParser()
            self.xmlParser.delegate = self
            self.xmlParser.startParsingWithContentsOfURL(rssURL: url!)
        }
        
    }
    

}


// MARK: - UITableViewDelegate,UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: VideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
        cell.updateVideoCell(indexPath: indexPath)
        if let imageUrlList = tileItems {
            cell.updateFetchedImageUrls(items: imageUrlList)
        }
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 120
        case 1:
            return 176
        case 2:
            return 148
        default:
            return 120
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell: VideoHeaderTableCell = tableView.dequeueReusableCell(withIdentifier: "VideoHeaderTableCell") as! VideoHeaderTableCell
        headerCell.updateTableHeaderText(section: section)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

// MARK: - Menu button tap delegate
extension HomeViewController: HomeMenuBarDelegate {
    
    func menuButtonTapAction(buttonIndex: Int) {
        guard currentMenuIndex != buttonIndex  else {
            return
        }
        currentMenuIndex = buttonIndex
        startXMLParsingWithMenu(menuIndex: buttonIndex)
    }
    
}

// MARK: - JBXML parser delegate
extension HomeViewController: JBXMLParserDelegate {
    
    func parsingWasFinished(parsedData: [Dictionary<String, String>]) {
        
        tileItems = SMVideoItems(withDictionary: parsedData)
        tableView.reloadData()
        
    }
    
    func parsingErrorOccurred(parseError: Error) {
        print(parseError)
    }
    
}

// MARK: - Video table cell delegate
extension HomeViewController: VideoTableViewCellDelegate {
    
    func userClickEventOnCollectionViewCell(tableViewSession: Int, collectionCellIndexpath: IndexPath, cellImage: UIImage) {
        Helper.sharedInstance.getAppController().loadVideoDetailViewController(tileImage: cellImage, currentViewController: self)
    }
}
