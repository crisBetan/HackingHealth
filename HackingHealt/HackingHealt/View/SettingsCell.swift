//
//  SettingsCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let functionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let forwardImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Forward")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(functionLabel)
        addSubview(forwardImage)
        
        //date image Constrains
        functionLabel.widthAnchor.constraint(equalToConstant: 375).isActive = true
        functionLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        functionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        functionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        forwardImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        forwardImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        forwardImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        forwardImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
    }
    
    
    
}
