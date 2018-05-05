//
//  SettingsTableViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleDismissButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogout))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Configuración"
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let  logoutError  {
            print(logoutError)
        }
        let loginController = LoginViewController()
        let logingContoller = UINavigationController(rootViewController: loginController)
        present(logingContoller, animated: true, completion: nil)
    }
    
    let Array = ["Cuenta","Notificaciones","Privacidad","Información"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Array[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    @objc func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

