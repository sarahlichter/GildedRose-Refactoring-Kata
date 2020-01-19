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
            item.quality -= 1
        }
        item.sellIn -= 1
        
        if item.sellIn < 0 {
            if item.quality > 0 {
                item.quality -= 1
            }
        }

    }
}
