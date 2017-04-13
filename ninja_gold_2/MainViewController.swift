//
//  MainViewController.swift
//  ninja_gold_2
//
//  Created by Andy Feng on 4/13/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddGoldDelegate {
    
    
    // MARK: Global Variables ========================
    var buildingArr = [Building]()
    var total:Double = 0.00
    
    
    
    
    
    // MARK: Outlets =================================
    @IBOutlet weak var totalGoldLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill up the array 
        buildingArr.append(Building(img: UIImage(named: "house")!, name: "house"))
        buildingArr.append(Building(img: UIImage(named: "farm")!, name: "farm"))
        buildingArr.append(Building(img: UIImage(named: "cave")!, name: "cave"))
        buildingArr.append(Building(img: UIImage(named: "casino")!, name: "casino"))
        
        totalGoldLabel.text = "Total Gold: \(total)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: Table View Methods =======================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue custom cell
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! BuildingCell
        
        // Set the model 
        cell.model = buildingArr[indexPath.row]
        
        // Set the delegate
        cell.addGoldDel = self
       
        return cell
    }
    
    
    
    func addGold(amount: Int, casino: Bool) {
        
        print(amount)
        
        if casino {
            print("it's the casino!!")
            
            if amount == 1 {
                // Add gold 
                total += total * 0.1
                
                let str = String(format: "%.2f", total)
                
                totalGoldLabel.text = "Total Gold: \(str)"

                
            } else {
                // Take away gold
                total -= total * 0.1
                let str = String(format: "%.2f", total)
                
                totalGoldLabel.text = "Total Gold: \(str)"
            }
            
            
            
        } else {
            total += Double(amount)
            
            let str = String(format: "%.2f", total)
            
            totalGoldLabel.text = "Total Gold: \(str)"
   
        }
        
        
        
        
        
        
    }


}













