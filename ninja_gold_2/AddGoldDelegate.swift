//
//  AddGoldDelegate.swift
//  ninja_gold_2
//
//  Created by Andy Feng on 4/13/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import Foundation

protocol AddGoldDelegate: class {
    func addGold(amount: Int, casino: Bool)
}
