//
//  DetailCollectionViewController.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Amigos"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleDismissButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Add"), style: .plain, target: nil, action: nil)
        
        
        collectionView?.register(DetailCell.self, forCellWithReuseIdentifier: "detail")
        
    }
    
    
    
    @objc func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    let friends = ["Daniel de San", "Cristina Betan", "Pedro Vázquez", "Luis Morelos"]
    let level = ["23","20","22", "20"]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail", for: indexPath) as! DetailCell
        cell.profileImage.backgroundColor = UIColor.lightGray
        cell.levelLabel.text = level[indexPath.row]
        cell.nameLabel.text = friends[indexPath.row]
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 182, height: 182)
    }
    
}

