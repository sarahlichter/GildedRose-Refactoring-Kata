//
//  File.swift
//  
//
//  Created by sarah.lichter on 1/18/20.
//

import Foundation

class BackstagePass: GildedItem {
    func updateValues(item: Item) {

        if item.quality < 50 {
            item.quality += 1
            if item.sellIn < 11 && item.quality < 50 {
                item.quality += 1
            }
            
            if item.sellIn < 6 && item.quality < 50 {
                item.quality += 1
            }
        }
        item.sellIn -= 1
        if item.sellIn < 0 {
            item.quality = 0
        }
    }
}
