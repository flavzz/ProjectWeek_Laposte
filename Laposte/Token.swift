//
//  Token.swift
//  Laposte
//
//  Created by Flavien SICARD on 17/03/2015.
//  Copyright (c) 2015 Flavien SICARD. All rights reserved.
//

import UIKit
import CryptoSwift

class Token: NSObject {
    
    func Get(Name: String) -> String {
        var token:String = ""
        var tmp:String = (Name + "\(NSDate())").sha512()!
        
        for i in 0 ... 8 { token = token + tmp[i] }
        return token
    }
}
