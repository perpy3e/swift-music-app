//
//  loading.swift
//  musicApp
//
//  Created by Siripoom Jaruphoom on 25/10/23.
//

import UIKit

class loading: NSObject {

    func load(file:String) -> [String] {
        var Array:[String] = []
        
        let path = Bundle.main.url(forResource: file, withExtension: "plist")
        let testData = try? Data(contentsOf: path!)
        let myPlist = try? PropertyListSerialization.propertyList(from: testData!, options: [], format: nil)
        Array=myPlist as! [String]
        
        return Array
    }
}
