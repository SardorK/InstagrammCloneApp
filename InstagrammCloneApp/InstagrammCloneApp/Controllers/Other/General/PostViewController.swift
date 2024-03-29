//
//  PostViewController.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 07/02/23.
//

import UIKit

/*
 Section
 - Header Model
 Section
 - Post Cell Model
 Section
 - Action Buttons Cell model
 Section
 -
 */

enum PostRenderType{
    case header(provider: User)
    case primaryContent(provider: UserPost)
    case actions(provider: String) // like , comment , share
    case comments(comments: [PostComment])
}

struct PostRenderViewModel {
    let renderType: PostRenderType
}

class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identefier)
        view.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.identefier)
        view.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identefier)
        view.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identefier)
        
        return view
    }()
    
    // MARK: Init
    
    init(model: UserPost){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    

}

extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType{
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 4 ? 4 : comments.count
        case .primaryContent(_): return 1
        case .header(_): return 1
        }
        
        return 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        
        switch model.renderType{
        case .actions(let actions):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.identefier, for: indexPath) as! IGFeedPostActionsTableViewCell
            return cell
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.identefier, for: indexPath) as! IGFeedPostGeneralTableViewCell
            return cell
        case .primaryContent(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identefier, for: indexPath) as! IGFeedPostTableViewCell
            return cell
        case .header(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.identefier, for: indexPath) as! IGFeedPostHeaderTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        
        switch model.renderType{
        case .actions(_): return 60
        case .comments(_): return 50
        case .primaryContent(_): return tableView.width
        case .header(_): return 70
        }
    }
}

