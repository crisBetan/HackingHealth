//
//  TodayViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 03/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self , action: #selector(handleLogout))
        // Do any additional setup after loading the view.
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
                user.profileImageUrl = dictionary["profileImageUrl"] as? String
                user.lastName = dictionary["lastName"]as? String
                self.navigationItem.title = user.name
               
                if let image = user.profileImageUrl{
                    //self.imageProfileView.loadImageUsingCacheWithUrlString(urlString: image)
                }
                
                DispatchQueue.main.async {
                    //  self.imageProfileView.reloadInputViews()
                    
                }
                
                print(user)
            }
        }, withCancel: nil)
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
