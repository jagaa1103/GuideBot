//
//  LoginService.swift
//  GuideBot
//
//  Created by Enkhjargal Gansukh on 13/04/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Firebase
import FacebookCore
import FacebookLogin

class LoginService: NSObject {
    static let instance = LoginService()
    var loginStatus = false
    let loginManager = LoginManager()
    
    override init() {
        super.init()
    }
    
    func isLoggedIn() -> Bool {
        if let accessToken = AccessToken.current { 
            print(accessToken)
            return true
        }else{
            return false
        }
    }
    
    
    func login() -> Bool {
        return false
    }
    
    func logout(){
    }
    
    func setLoginButton(view: UIView){
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
}
