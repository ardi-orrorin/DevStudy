//
//  ViewController.swift
//  helloworld
//
//  Created by 유승철 on 12/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var blbLabel: UILabel!
    
    @IBOutlet var txtNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        blbLabel.text = "this is \(txtNameField.text!)"
    }
    
}

