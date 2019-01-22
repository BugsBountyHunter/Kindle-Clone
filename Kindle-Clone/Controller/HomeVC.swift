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
        //tabelview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: BOOKS_CELL)
        tableView.backgroundColor = .green
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
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BOOKS_CELL, for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }

}

