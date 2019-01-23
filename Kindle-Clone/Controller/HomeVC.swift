//
//  ViewController.swift
//  Kindle-Clone
//
//  Created by AHMED SR on 1/22/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instanc.getData()
        //tabelview
        tableView.register(BookCell.self, forCellReuseIdentifier: BOOKS_CELL)
        tableView.backgroundColor = UIColor.lightGray
        tableView.tableFooterView = UIView()
        setupNavigationBar()
    }
    //MARK:- Setup NAvigationController
    func setupNavigationBar(){
        //bar color
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 40/255)
        //title
        navigationItem.title = "Kindle"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1) , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        //button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(handleLeftButon))

         navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(handleRightButon))
    }

    //handelNavigationButton
    @objc func handleLeftButon(){
        print(" Left Button ..")
    }
    @objc func handleRightButon(){
        print(" Right Button ..")
    }
    //table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instanc.books.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BOOKS_CELL, for: indexPath) as? BookCell else {fatalError()}
        let item = DataService.instanc.books[indexPath.row]
        cell.setupCell(book: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)

        let segmentController:UISegmentedControl = {
          let seg = UISegmentedControl(items: ["Cloude","Device"])
          seg.translatesAutoresizingMaskIntoConstraints = false
          seg.tintColor = .white
          seg.selectedSegmentIndex = 0
          return seg
        }()
        footerView.addSubview(segmentController)
        NSLayoutConstraint.activate([
            segmentController.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            segmentController.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            segmentController.heightAnchor.constraint(equalToConstant: 30),
            segmentController.widthAnchor.constraint(equalToConstant: 200)
            ])
        let gridBtn:UIButton = {
           let btn = UIButton(type: .system)
            btn.setImage(#imageLiteral(resourceName: "list").withRenderingMode(.alwaysOriginal), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
           return btn
        }()
        footerView.addSubview(gridBtn)
        NSLayoutConstraint.activate([
            gridBtn.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 10),
            gridBtn.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            gridBtn.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -10),
            gridBtn.widthAnchor.constraint(equalToConstant: 30)
            ])
        let reveresBtn:UIButton = {
            let btn = UIButton(type: .system)
            btn.setImage(#imageLiteral(resourceName: "reverse").withRenderingMode(.alwaysOriginal), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            return btn
        }()
        footerView.addSubview(reveresBtn)
        NSLayoutConstraint.activate([
            reveresBtn.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -10),
            reveresBtn.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            reveresBtn.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -10),
            reveresBtn.widthAnchor.constraint(equalToConstant: 30)
            ])
//        NSLayoutConstraint.activate([
//            footerView.heightAnchor.constraint(equalToConstant: 50),
//            footerView.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: 0),
//            footerView.rightAnchor.constraint(equalTo: tableView.rightAnchor, constant: 0),
//            footerView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0)
//            ])
        return footerView
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

}

