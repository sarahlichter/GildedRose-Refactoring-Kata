//
//  File.swift
//  
//
//  Created by sarah.lichter on 1/18/20.
//

import Foundation

class Brie: GildedItem {
    func updateValues(item: Item) {
        if item.quality < 50 {
            let increase = item.sellIn < 0 ? 2 : 1
            item.quality += increase
        }
        item.sellIn -= 1

    }
}
