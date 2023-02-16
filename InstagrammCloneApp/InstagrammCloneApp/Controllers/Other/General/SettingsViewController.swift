//
//  SettingsViewController.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 07/02/23.
//
import SafariServices
import UIKit

struct SettingCellModel{
    let title: String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return view
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        configureModels()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        data.append([
            SettingCellModel(title: "Edit Profile"){[weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "Invite Friends"){[weak self] in
                self?.didTapInviteFriends()
            },
            SettingCellModel(title: "Save Original Posts"){[weak self] in
                self?.didTapOriginalPosts()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Terms of Service"){[weak self] in
                self?.openUrl(type: .terms)
            },
            SettingCellModel(title: "Privacy Policy"){[weak self] in
                self?.openUrl(type: .privacy)
            },
            SettingCellModel(title: "Help / Feedback"){[weak self] in
                self?.openUrl(type: .help)
            }
        ])
        
        data.append([
            SettingCellModel(title: "Log Out"){[weak self] in
                
            }
        ])
    }
    
    enum SettingsUrlType{
        case terms,privacy,help
    }
    
    private func openUrl(type: SettingsUrlType){
        let urlString: String
        switch type{
        case .terms: urlString = "https://help.instagram.com/581066165581870"
        case .privacy: urlString = "https://help.instagram.com/155833707900388"
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc,animated: true)
    }
    
    private func didTapInviteFriends(){
        
    }
    
    private func didTapOriginalPosts(){
        
    }
    
    private func didTapEditProfile(){
        let vc = EditViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC,animated: true)
    }
    
    private func didTapLogOut(){
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out ?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive,handler: { _ in
            AuthManager.shared.logOut { succes in
                DispatchQueue.main.async {
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC,animated: true) {
                        self.navigationController?.popToRootViewController(animated: false)
                        self.tabBarController?.selectedIndex = 0
                    }
                }
            }
        }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet,animated: true)
        
    }
    


}


extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
    
}
