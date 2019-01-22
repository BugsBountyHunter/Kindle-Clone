//
//  Book.swift
//  Kindle-Clone
//
//  Created by AHMED SR on 1/22/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import Foundation

class Book {
    var title:String = ""
    var author:String = ""
    var imageName:String = ""
    var pages = [Page]()
//    init(title:String , author:String , imageName:String , pages:[Page]) {
//        self.title = title
//        self.author = author
//        self.imageName = imageName
//        self.pages = pages
//    }
    init(bookDic:[String:Any]) {
        guard let bookTitle = bookDic["title"] as? String else{return}
        guard let bookAuthor = bookDic["author"] as? String else{return}
        guard let coverBookImageURL = bookDic["coverImageUrl"] as? String else{return}
        print(coverBookImageURL)
        self.imageName = coverBookImageURL
        self.title = bookTitle
        self.author = bookAuthor
        guard let bookPages = bookDic["pages"] as? [[String:Any]] else {return}
        for page in bookPages{
            let pageBook = Page(pageBook: page)
            self.pages.append(pageBook)
        }

    }
}
