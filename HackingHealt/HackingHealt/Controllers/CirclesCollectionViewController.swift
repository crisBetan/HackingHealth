//
//  CirclesCollectionViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//
import UIKit
import Firebase

class CirclesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var  user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Circulos"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ChatBot"), style: .plain, target: self, action: #selector(handleChatBot))
        let settingsBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "settings"), style: .plain, target: self, action: #selector(handleSettings))
        let addBarButton  = UIBarButtonItem(image: #imageLiteral(resourceName: "Add"), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItems = [settingsBarButton,addBarButton]
        fetchUser()
        collectionView?.register(CirclesCell.self, forCellWithReuseIdentifier: "circlesCell")
        
    }
    
    @objc func handleSettings(){
        let settings = SettingsTableViewController()
        
        let settingsController = UINavigationController(rootViewController: settings)
        present(settingsController, animated: true, completion: nil)
        
    }
    
    
    
    
    var circlesArray = ["Familia", "Trabajo", "Amigos", "Otros"]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return circlesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circlesCell", for: indexPath) as! CirclesCell
        print(indexPath.item)
        cell.circleLabel.text = circlesArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 182, height: 182)
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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCircles()
    }
    func handleCircles(){
        
    
        let circles = DetailCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let circlesController = UINavigationController(rootViewController: circles)
        present(circlesController, animated: true, completion: nil)
        
    }
    
}

