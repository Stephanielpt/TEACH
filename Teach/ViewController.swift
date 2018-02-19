//
//  ViewController.swift
//  Teach
//
//  Created by Stephanie Lampotang on 2/17/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func donePressed(_ sender: UIButton) {
        if(nameField.text!.count > 0){
            welcomeName.text = "Welcome, \(nameField.text!)!"
            nextButton.alpha = 1
        }
        else{
            welcomeName.text = "Enter your name ple.."
        }
    }
    
    @IBOutlet weak var welcomeName: UILabel!
    
    @IBAction func changeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "home", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is HomeViewController
        {
            if let vc = segue.destination as? HomeViewController
            {vc.names = [nameField.text!]}
        }
    }
}

