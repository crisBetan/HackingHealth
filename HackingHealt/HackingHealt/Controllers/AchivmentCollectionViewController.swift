//
//  AchivmentCollectionViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//
import UIKit
import Firebase

class AchievmentCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
     var  user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Mis Logros"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ChatBot"), style: .plain, target: self , action: #selector(handleChatBot))
        let settingsBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(handleSettings))
        fetchUser()
        
        navigationItem.rightBarButtonItems = [settingsBarButton]
        
        collectionView?.register(AchievmentCell.self, forCellWithReuseIdentifier: "achievment")
        
    }
    @objc func handleChatBot(){
        if let usuario = user{
            showChatControllerForUser(user: usuario)
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
               
                self.user = user
            }
        }, withCancel: nil)
    }
    
    @objc func showChatControllerForUser(user:User) {
        
        let chatLogController = ChatBotCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        
        let chatlogController1 = UINavigationController(rootViewController: chatLogController)
        present(chatlogController1, animated: true, completion: nil)
        //navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    @objc func handleSettings(){
        let settings = SettingsTableViewController()
        
        let settingsController = UINavigationController(rootViewController: settings)
        present(settingsController, animated: true, completion: nil)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievment", for: indexPath) as! AchievmentCell
        print(indexPath.item)
        if indexPath.item == 0{
            cell.achievmentImage.image = #imageLiteral(resourceName: "Achievments1")
            cell.dateLabel.text = "1 Semana"
            cell.stufLabel.text = "Entrenando"
        }else{
            cell.achievmentImage.image = #imageLiteral(resourceName: "Achievments2")
            cell.dateLabel.text = "3 meses"
            cell.stufLabel.text = "Entrenando"
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 182, height: 182)
    }
    
}

