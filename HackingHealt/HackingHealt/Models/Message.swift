//
//  Message.swift
//  HackingHealt
//
//  Created by Pedro Antonio Vazquez Rodriguez on 04/05/18.
//  Copyright © 2018 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    var fromId:String?
    var text:String?
    var timeSnap:NSNumber?
    var toId: String?
    
    func chatPartnerId() -> String? {
        if fromId == Auth.auth().currentUser?.uid{
            return toId
        }else{
            return fromId
        }
    }
    
}
