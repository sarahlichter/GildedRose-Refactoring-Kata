public class GildedRose {
    var items:[Item]
    
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    let backstagePass = "Backstage passes to a TAFKAL80ETC concert"
    
    public init(items:[Item]) {
        self.items = items
    }
    
    fileprivate func decreaseSellIn(_ item: Item) {
        item.sellIn -= 1
    }
    
    fileprivate func applyBaseQualityAdjustments(_ item: Item) {
        if item.name != "Aged Brie" && item.name != backstagePass {
            if item.quality > 0 {
                    item.quality -= 1
            }
        } else {
            if item.quality < 50 {
                item.quality += 1
                
                if item.name == backstagePass {
                    if item.sellIn < 11 {
                        if item.quality < 50 {
                            item.quality += 1
                        }
                    }
                    
                    if item.sellIn < 6 {
                        if item.quality < 50 {
                            item.quality += 1
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func applyQualityAdjustmentsForNegativeSellin(_ item: Item) {
        if item.sellIn < 0 {
            if item.name != "Aged Brie" {
                if item.name == backstagePass {
                    item.quality = item.quality - item.quality
                } else {
                    if item.quality > 0 {
                        item.quality -= 1
                    }
                }
            } else {
                if item.quality < 50 {
                    item.quality += 1
                }
            }
        }
    }
    
    public func adjustValues() {
        for item in items {
            switch item.name {
            case sulfuras:
                Sulfuras().updateValues(item: item)
            case backstagePass:
                BackstagePass().updateValues(item: item)
            default:
                applyBaseQualityAdjustments(item)
                decreaseSellIn(item)
                applyQualityAdjustmentsForNegativeSellin(item)
            }
        }

    }
}
