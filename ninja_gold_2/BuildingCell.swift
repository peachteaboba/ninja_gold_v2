//
//  BuildingCell.swift
//  ninja_gold_2
//
//  Created by Andy Feng on 4/13/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class BuildingCell: UITableViewCell {
    
    var amount: String?
    var addGoldDel: AddGoldDelegate?
    
    
    
    
    // Outlets =======================
    @IBOutlet weak var buildingImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func handleGoButtonClicked(_ sender: UIButton) {
        
        _model?.count += 1
        if let c = _model?.count {
            // Setting the count label
            countLabel.text = "click count: \(c)"
        }
        
        var min = 0
        var max = 0
        var cas = false
        
        
        if _model?.name == "house" {
            min = 1
            max = 6
        } else if _model?.name == "farm" {
            min = 10
            max = 21
        } else if _model?.name == "cave" {
            min = 25
            max = 51
        } else{
            min = 0
            max = 2
            cas = true
        }
        
        let rand = Int(arc4random_uniform(UInt32(max - min))) + min
        

        addGoldDel?.addGold(amount: rand, casino: cas)
        
    
        
    }
    
    // Model =========================
    private var _model: Building?
    
    // Create a getter and setter for this model
    var model: Building {
        
        set{
            _model = newValue
            
            // Do stuff
            doStuff()
        }
        get {
            
            return Building(img: UIImage(named: "house")!, name: "NOPE!!")
        }

    }
    
    func doStuff(){
        print("doing stuff!")
        
        // Set the image
        buildingImage.image = _model?.img
        
        if let c = _model?.count {
        
            // Setting the labels
            countLabel.text = "click count: \(c)"
        }
        
        if _model?.name == "house" {
            print("i'm a house")
            amount = "+1 ~ 5"
        } else if _model?.name == "farm" {
            print("i'm a farm")
            amount = "+10 ~ 20"
        } else if _model?.name == "cave" {
            print("i'm a farm")
            amount = "+25 ~ 50"
        } else{
            print("i'm a casino")
            amount = "+ / - 10%"
        }
        
        amountLabel.text = amount
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
