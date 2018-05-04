//
//  DistanceCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class DistanceCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let distanceLabel: UILabel = {
        var label = UILabel()
        label.text = "Distancia Recorrida"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let quantityLabel: UILabel = {
        var label = UILabel()
        label.text = "20"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 48)
        return label
    }()
    
    let notationLabel: UILabel = {
        var label = UILabel()
        label.text = "km"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(distanceLabel)
        addSubview(quantityLabel)
        addSubview(notationLabel)
        
        //date image Constrains
        distanceLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 13).isActive = true
        distanceLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        //quantityLabel Constrains
        quantityLabel.widthAnchor.constraint(equalToConstant: 58).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        quantityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -71).isActive = true
        quantityLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        //notationLabel contrains
        notationLabel.widthAnchor.constraint(equalToConstant: 21).isActive = true
        notationLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        notationLabel.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: -10).isActive = true
        notationLabel.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor).isActive = true
    }
    
    
}
