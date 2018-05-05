//
//  CirclesCell.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class CirclesCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let circleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "SocialSymbol")
        return image
    }()
    
    var circleLabel: UILabel = {
        var label = UILabel()
        label.text = "Familia"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(circleImageView)
        addSubview(circleLabel)
        
        //date image Constrains
        circleImageView.widthAnchor.constraint(equalToConstant: 118).isActive = true
        circleImageView.heightAnchor.constraint(equalToConstant: 118).isActive = true
        circleImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        circleImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        //quantityLabel Constrains
        circleLabel.widthAnchor.constraint(equalToConstant: 117).isActive = true
        circleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        circleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleLabel.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 1).isActive = true
        
        
    }
    
    
}
