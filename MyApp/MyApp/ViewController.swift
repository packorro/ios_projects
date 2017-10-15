//
//  ViewController.swift
//  MyApp
//
//  Created by Packo on 10/10/17.
//  Copyright © 2017 Packo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Cambia texto de Label Mensaje
        label.text = "Packo Garcia..."
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

