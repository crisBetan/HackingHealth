//
//  DetailCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//
import UIKit

class DetailCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var levelLabel: UILabel = {
        var label = UILabel()
        label.text = "1 Semana"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Entrenando"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(profileImage)
        addSubview(levelLabel)
        addSubview(nameLabel)
        
        //date image Constrains
        profileImage.widthAnchor.constraint(equalToConstant: 118).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 118).isActive = true
        profileImage.layer.cornerRadius = 118/2
        profileImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        //quantityLabel Constrains
        levelLabel.widthAnchor.constraint(equalToConstant: 64).isActive = true
        levelLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        levelLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        levelLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
        nameLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
    
    
}
