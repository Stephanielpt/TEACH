//
//  HomeViewController.swift
//  Teach
//
//  Created by Stephanie Lampotang on 2/17/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var names = ["Stephanie","Tyler","Spencer","Sara", "Glory", "Markie"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "steph")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "steph") as? UITableViewCell
        cell?.textLabel?.text = "\(names[indexPath.row])"
        return cell!
    }
    
    @IBAction func toDrawSlide(_ sender: Any) {
        self.performSegue(withIdentifier: "draw", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
