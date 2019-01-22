//
//  Page.swift
//  Kindle-Clone
//
//  Created by AHMED SR on 1/22/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import Foundation
class Page {
    var numbers:Int = 0
    var text:String = ""
    
//    init(numbers:Int , text:String) {
//        self.numbers = numbers
//        self.text = text
//    }
    init(pageBook:[String:Any]) {
        guard let pageNumber = pageBook["id"] as? Int else{return }
        guard let pageText = pageBook["text"] as? String else{return}
        self.numbers = pageNumber
        self.text = pageText
    }
}
