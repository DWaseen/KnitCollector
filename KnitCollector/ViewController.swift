//
//  ViewController.swift
//  KnitCollector
//
//  Created by Dan Waseen on 11/28/16.
//  Copyright © 2016 RevWon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!

    var knits : [Knits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
        do{
            knits = try context.fetch(Knits.fetchRequest())
            tableView.reloadData()
        }
        catch{
            
        }
    } // end  override func viewWillAppear

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let knit = knits[indexPath.row]
        cell.textLabel?.text = knit.title
        cell.imageView?.image = UIImage(data: knit.image! as Data)
        return cell
    }
    
} // end class viewController

