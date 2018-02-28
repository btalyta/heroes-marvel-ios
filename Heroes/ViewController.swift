//
//  ViewController.swift
//  Heroes
//
//  Created by Bárbara Souza on 27/02/18.
//  Copyright © 2018 Bárbara Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.tfName.resignFirstResponder()
        let newController = segue.destination as! HeroesTableViewController
        newController.name = self.tfName.text
    }


}

