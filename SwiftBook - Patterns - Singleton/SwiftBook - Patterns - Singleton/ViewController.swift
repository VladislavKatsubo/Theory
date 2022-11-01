//
//  ViewController.swift
//  SwiftBook - Patterns - Singleton
//
//  Created by Vlad Katsubo on 1.11.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let safe = Safe.shared
        print(safe.money)
    }


}

