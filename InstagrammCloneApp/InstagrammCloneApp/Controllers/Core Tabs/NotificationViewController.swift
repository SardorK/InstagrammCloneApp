//
//  NotificationViewController.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 07/02/23.
//

import UIKit

enum UserNotificationType{
    case like(post: UserPost)
    case follow(state: FollowState)
}

struct UserNotification{
    let type: UserNotificationType
    let text: String
    let user: User
}

final class NotificationViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identefier)
        tableView.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identefier)
        
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    private var models = [UserNotification]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()
        navigationItem.title = "Notifications"
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func fetchNotifications(){
        let user = User(username: "joe", bio: " ", name: (first: "",last: ""), profilePhoto: URL(string: "https://www.google.com")!, birthDate: Date(), gender: .male, counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date())
        for x in 1...100{
            let post = UserPost(identifier: "", postType: .photo, thumbnailImage: URL(string: "https://www.google.com")!, postURL: URL(string: "https://www.google.com")!, caption: nil, likeCount: [], comments: [], createdDate: Date(), tagggedUsers: [],owner: user)
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow(state: .not_following), text: "Hello", user: user)
            models.append(model)
        }
    }
    
    private func layoutNoNotificationsView(){
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/4)
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type{
        case .like(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identefier,for: indexPath) as! NotificationLikeEventTableViewCell
            
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identefier,for: indexPath) as! NotificationFollowEventTableViewCell
            
//            cell.configure(with: model)
            cell.delegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }

}


extension NotificationViewController: NotificationLikeEventTableViewCellDelegate {
    func didTapRelatedPostButton(model: UserNotification) {
        switch model.type{
        case .like(let post):
            let vc = PostViewController(model: post)
            vc.title = post.postType.rawValue
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        case .follow(_):
            fatalError("Dev issue")
        }
    }
}

extension NotificationViewController: NotificationFollowEventTableViewCellDelegate {
    
    func didTapFollowUnfollowButton(model: UserNotification) {
        print("Tapped Follow")
    }
}
