//
//  SearchDetailViewController.swift
//  Project
//
//  Created by ブラック狼 on 12.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mainElement: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbleViewParameters()
    }
    
    func tabbleViewParameters() {
        tableView.register(UINib(nibName: "SearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }


}
