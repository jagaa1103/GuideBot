//
//  ViewController.swift
//  GuideBot
//
//  Created by Enkhjargal Gansukh on 13/04/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !LoginService.instance.isLoggedIn() { LoginService.instance.setLoginButton(view: self.view) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

