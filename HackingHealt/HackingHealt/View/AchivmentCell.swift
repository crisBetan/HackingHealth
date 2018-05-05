//
//  AchivmentCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class AchievmentCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let achievmentImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.text = "1 Semana"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    var stufLabel: UILabel = {
        var label = UILabel()
        label.text = "Entrenando"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(achievmentImage)
        addSubview(dateLabel)
        addSubview(stufLabel)
        
        //date image Constrains
        achievmentImage.widthAnchor.constraint(equalToConstant: 118).isActive = true
        achievmentImage.heightAnchor.constraint(equalToConstant: 115).isActive = true
        achievmentImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        achievmentImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        //quantityLabel Constrains
        dateLabel.widthAnchor.constraint(equalToConstant: 64).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        
        stufLabel.widthAnchor.constraint(equalToConstant: 104).isActive = true
        stufLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        stufLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stufLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        
        
    }
    
    
}
