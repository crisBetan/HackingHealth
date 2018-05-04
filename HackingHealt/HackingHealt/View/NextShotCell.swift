//
//  NextShotCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//
import UIKit

class NextShotCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nextShotLabel: UILabel = {
        var label = UILabel()
        label.text = "Próxima dosis"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let hourLabel: UILabel = {
        var label = UILabel()
        label.text = "9:41"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 48)
        return label
    }()
    
    let notationLabel: UILabel = {
        var label = UILabel()
        label.text = "AM"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(nextShotLabel)
        addSubview(hourLabel)
        addSubview(notationLabel)
        
        //date image Constrains
        nextShotLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        nextShotLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        nextShotLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 13).isActive = true
        nextShotLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        //quantityLabel Constrains
        hourLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        hourLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        hourLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        //notationLabel contrains
        notationLabel.widthAnchor.constraint(equalToConstant: 23).isActive = true
        notationLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        notationLabel.bottomAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: -10).isActive = true
        notationLabel.leftAnchor.constraint(equalTo: hourLabel.rightAnchor).isActive = true
    }
    
    
}
