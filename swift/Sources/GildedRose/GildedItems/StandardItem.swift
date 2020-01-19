//
//  File.swift
//  
//
//  Created by sarah.lichter on 1/18/20.
//

import Foundation

class StandardItem: GildedItem {
    func updateValues(item: Item) {
        if item.quality > 0 {
            let reduction = item.quality <= 0 ? 2 : 1
            item.quality -= reduction
        }
        item.sellIn -= 1
    }
}
