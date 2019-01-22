//
//  BookCell.swift
//  Kindle-Clone
//
//  Created by AHMED SR on 1/22/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit

class BookCell:UITableViewCell{
    
    private var bookImage:UIImageView  = {
       let image = UIImageView()
        image.backgroundColor = .red
        image.image = #imageLiteral(resourceName: "Profile")
        image.clipsToBounds = true
        image.layer.cornerRadius = 5.0
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return  image
    }()
    
    private var bookTitleLbl:UILabel = {
       let bookLbl = UILabel()
        bookLbl.translatesAutoresizingMaskIntoConstraints = false
        bookLbl.text = "The Dream"
        bookLbl.font = UIFont(name: "Avenir", size: 22)
        bookLbl.textColor = .white
        return bookLbl
    }()
    private var bookAuthor:UILabel = {
        let bookLbl = UILabel()
        bookLbl.translatesAutoresizingMaskIntoConstraints = false
        bookLbl.font = UIFont(name: "Avenir", size: 16)
        bookLbl.text = "Ahmed saber"
        bookLbl.textColor = .darkGray
        return bookLbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubview(bookImage)
        addSubview(bookTitleLbl)
        addSubview(bookAuthor)
        setupAutoLayoutConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell(book:Book){
        self.bookTitleLbl.text = book.title
        self.bookAuthor.text = book.author
        if  book.imageName != "" {
            let url = URL(string: book.imageName)
            URLSession.shared.dataTask(with: url!) { (data, respons, error) in
                if error != nil {
                    print(error?.localizedDescription as Any)
                }else{
                    guard let imageData = data else{return}
                    let image = UIImage(data: imageData)
                    print(imageData)
                    DispatchQueue.main.async {
                        self.bookImage.image = image
                    }
                }
            }.resume()
        }
        
    }
    //AutoLayout for cell
    func setupAutoLayoutConstraint(){
        //BookImage Constraint
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                bookImage.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8),
                bookImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                bookImage.widthAnchor.constraint(equalToConstant: 60)
                ])
        } else {
            // Fallback on earlier versions
            NSLayoutConstraint.activate([
                bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                bookImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
                bookImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                bookImage.widthAnchor.constraint(equalToConstant: 60)
                ])
        }
        
        //BookTitle Constraint
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                bookTitleLbl.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 8),
                bookTitleLbl.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8),
                bookTitleLbl.heightAnchor.constraint(equalToConstant: 30),
                bookTitleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor ,constant: -15)
                ])
        } else {
            // Fallback on earlier versions
            NSLayoutConstraint.activate([
                bookTitleLbl.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 8),
                bookTitleLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
                bookTitleLbl.heightAnchor.constraint(equalToConstant: 20),
                bookTitleLbl.centerYAnchor.constraint(equalTo: centerYAnchor ,constant: -15)
                ])
        }
        //BookAuthor Constraint
            NSLayoutConstraint.activate([
                bookAuthor.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 8),
               bookAuthor.topAnchor.constraint(equalTo: bookTitleLbl.bottomAnchor, constant: 0),
               bookAuthor.heightAnchor.constraint(equalToConstant: 20),
               bookAuthor.widthAnchor.constraint(equalTo: bookTitleLbl.widthAnchor, multiplier: 0.75)
//               bookAuthor.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
                ])
    }
}
