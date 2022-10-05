//
//  MyViewController.swift
//  AutoLayoutPractice
//
//  Created by JongHoon on 2022/10/04.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        yellowView.layer.cornerRadius = 20
    }
}
