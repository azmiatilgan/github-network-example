//
//  ViewController.swift
//  github-example
//
//  Created by BUGRU on 11.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let network = NetworkLayer()
        network.fetchFromGithubSearch()
    }

}

