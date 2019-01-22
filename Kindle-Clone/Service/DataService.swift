//
//  DataService.swift
//  Kindle-Clone
//
//  Created by AHMED SR on 1/22/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit

class DataService{
    static let instanc = DataService()
    //
    var books = [Book]()
    var pages = [Page]()
    func getData(){
        guard let url = URL(string: BOOK_URL) else{return }
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            var books = [Book]()
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                guard let data = data  else {return }
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    guard let bookDectionary = json as? [[String:Any]] else {return}
                    for bookDecArray in bookDectionary {
                        let bookDic = Book(bookDic: bookDecArray)
                        books.append(bookDic)
                    }
                }catch{
                    print(error.localizedDescription as Any)
                }
            }
            self.books = books
        }.resume()
    }
}
