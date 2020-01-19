public class GildedRose {
    var items:[Item]
    
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    let backstagePass = "Backstage passes to a TAFKAL80ETC concert"
    let brie = "Aged Brie"
    
    public init(items:[Item]) {
        self.items = items
    }
        
    public func adjustValues() {
        for item in items {
            switch item.name {
            case sulfuras:
                Sulfuras().updateValues(item: item)
            case backstagePass:
                BackstagePass().updateValues(item: item)
            case brie:
                Brie().updateValues(item: item)
            default:
                StandardItem().updateValues(item: item)
            }
        }

    }
}
