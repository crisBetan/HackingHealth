//
//  TodayViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 03/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class TodayTableViewController: UITableViewController  {
    
    var  user:User?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()

        tableView.register(DistanceCell.self, forCellReuseIdentifier: "distanceCell")
        tableView.register(NextShotCell.self, forCellReuseIdentifier: "nextShotCell")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Hoy"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ChatBot"), style: .plain,  target: self , action: #selector(handleChatBot))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(handleSettings))
        // Do any additional setup after loading the view.
        fetchUser()
    }
    @objc func handleSettings(){
        let settings = SettingsTableViewController()
        
        let settingsController = UINavigationController(rootViewController: settings)
        present(settingsController, animated: true, completion: nil)
    
    }
    
    
    
    let cellArray = ["distanceCell","nextShotCell"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("entro")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellArray[indexPath[1]], for: indexPath)
        print(indexPath[1])
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser?.uid == nil{
            
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
        }else{
            fetchUser()
        }
    }
    
    func fetchUser() {
        guard  let uid =  Auth.auth().currentUser?.uid else{
            return
        }
        Database.database().reference().child("users").child(uid).observe(.value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                let user = User()
                
                user.name = dictionary["name"] as? String
                user.email = dictionary["email"] as? String
                user.id = snapshot.key
               // user.profileImageUrl = dictionary["profileImageUrl"] as? String
                //user.lastName = dictionary["lastName"]as? String
                //self.navigationItem.title = user.name
               
              //  if let image = user.profileImageUrl{
                    //self.imageProfileView.loadImageUsingCacheWithUrlString(urlString: image)
               // }
                
               // DispatchQueue.main.async {
                    //  self.imageProfileView.reloadInputViews()
                    
               // }
                
                self.user = user
            }
        }, withCancel: nil)
    }
    
    @objc func handleChatBot(){
        if let usuario = user{
        showChatControllerForUser(user: usuario)
        }
    }
    
    @objc func showChatControllerForUser(user:User) {
        
        let chatLogController = ChatBotCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user

        let chatlogController1 = UINavigationController(rootViewController: chatLogController)
        present(chatlogController1, animated: true, completion: nil)
        //navigationController?.pushViewController(chatLogController, animated: true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        checkIfUserIsLoggedIn()
    }

}
