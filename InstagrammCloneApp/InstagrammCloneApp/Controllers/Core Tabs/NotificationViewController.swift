//
//  NotificationViewController.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 07/02/23.
//

import UIKit

class NotificationViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        return cell
    }

}
