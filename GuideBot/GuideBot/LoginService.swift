//
//  LoginService.swift
//  GuideBot
//
//  Created by Enkhjargal Gansukh on 13/04/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

class LoginService: NSObject {
    static let instance = LoginService()
    var loginStatus = false
    override init() {
        super.init()
    }
    
    func isLoggedIn() -> Bool {
        if let accessToken = AccessToken.current {
            print(accessToken)
            return true
        }else{
            print("No accessToken")
            return false
        }
    }
    
    
    func login() {
        print("logging")
        if (parentView == nil) {
            return;
        }
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .email], viewController: parentView, completion: { result in
            print(result)
            switch result {
            case .failed(let error) :
                print(error)
            case .cancelled :
                print("User cancelled login.")
            case .success(_, _, let accessToken):
                print("Logged in!")
                print(accessToken)
            }
        })
    }
    
    func logout(){
    }
    
//    func setLoginButton(view: UIView){
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
//    }
    
    var parentView: UIViewController! = nil
    func showLoginView(view: UIViewController){
        parentView = view
        let backgroundView = UIView(frame: (parentView.view.bounds))
        let loginButton = UIButton(type: .custom)
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 60)
        loginButton.center = backgroundView.center
        loginButton.setTitle("Login by Facebook", for: .normal)
        loginButton.addTarget(self, action: #selector(LoginService.instance.login), for: .touchUpInside)
        backgroundView.addSubview(loginButton)
        parentView.view.addSubview(backgroundView)
    }
    
}
