/*******************************************************************************************
 * File Name        :  XMLParser.swift
 * Module Name      :  SwitchMediaTechnicalTest
 * Description      :  XMLParser class.
 * Author           :  Jithin Balan.
 *******************************************************************************************/

import UIKit
import Foundation

@objc protocol JBXMLParserDelegate{
    func parsingWasFinished(parsedData: [Dictionary<String, String>])
    func parsingErrorOccurred(parseError: Error)
}

class JBXMLParser: NSObject, XMLParserDelegate {
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharacters = ""
    
    var delegate : JBXMLParserDelegate?
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = XMLParser(contentsOf: rssURL as URL)
        parser!.delegate = self
        parser!.parse()
    }
    
    
    
    //MARK: NSXMLParserDelegate method implementation
    
    func parserDidEndDocument(_ parser: XMLParser) {
        DispatchQueue.main.async {
            Helper.sharedInstance.showNetworkIndicatorWith(visibility: false)
            self.delegate?.parsingWasFinished(parsedData: self.arrParsedData)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substring(from: 3)
            }
            if elementName == "imageUrl"{
                foundCharacters = (foundCharacters as NSString).substring(from: 0)
            }
            
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "imageUrl" {
                arrParsedData.append(currentDataDictionary)
            }
        }
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if (currentElement == "title" && currentElement != "Jithin") || currentElement == "link" || currentElement == "pubDate" || currentElement == "imageUrl"{
            foundCharacters += string
        }
    }

    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        DispatchQueue.main.async {
            Helper.sharedInstance.showNetworkIndicatorWith(visibility: false)
            self.delegate?.parsingErrorOccurred(parseError: parseError)
        }
    }

    
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        DispatchQueue.main.async {
            Helper.sharedInstance.showNetworkIndicatorWith(visibility: false)
            self.delegate?.parsingErrorOccurred(parseError: validationError)
        }
    }

    
}
