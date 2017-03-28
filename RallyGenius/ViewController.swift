//
//  ViewController.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/25/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let repo = SignRepository()
        let signs = repo.getAllSigns()
        for sign in signs {
            print(sign.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

