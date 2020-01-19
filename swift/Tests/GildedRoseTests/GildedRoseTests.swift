@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testFoo() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual("foo", app.items[0].name);
    }
    
    func testDexterityDecreasesBy1InSellInAndQuality() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(9, app.items[0].sellIn)
        XCTAssertEqual(19, app.items[0].quality)
    }
    
    func testAgedBrieIncreaseQualityAndDecreasesSellIn() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(1, app.items[0].sellIn)
        XCTAssertEqual(1, app.items[0].quality)
    }
    
    func testElixirDecreasesSellinAndQualityBy1() {
        let item = Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(4, app.items[0].sellIn)
        XCTAssertEqual(6, app.items[0].quality)
    }
    
    func testAgedBrieDoesNotIncreaseQualityAbove50() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 50)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(1, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testSulfurasDoesNotChangeAnyValues() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros",
                        sellIn: 0,
                        quality: 80)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(item.sellIn, app.items[0].sellIn)
        XCTAssertEqual(item.quality, app.items[0].quality)
    }
    
    func testSulfurasAllowsNegativeSellIn() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros",
                        sellIn: -1,
                        quality: 80)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(item.sellIn, app.items[0].sellIn)
        XCTAssertEqual(item.quality, app.items[0].quality)
    }
    
    func testSulfurasWithNegOneSellIn() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros",
                        sellIn: -1,
                        quality: 80)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(item.sellIn, app.items[0].sellIn)
        XCTAssertEqual(item.quality, app.items[0].quality)
    }
    
    func testBackStagePassIncreasesInQualityByOneWithMoreThan10SellInDays() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                        sellIn: 15,
                        quality: 20)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(14, app.items[0].sellIn)
        XCTAssertEqual(21, app.items[0].quality)
    }
    
    func testBackStagePassDoesNotIncreaseQualityAbove50() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                        sellIn: 10,
                        quality: 49)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(9, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testBackStagePassDoesIncreasesByTwoWith10SellInDays() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                        sellIn: 10,
                        quality: 48)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(9, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testBackStagePassIncreasesByThreeWith5OrLessSellinDays() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                        sellIn: 5,
                        quality: 45)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(4, app.items[0].sellIn)
        XCTAssertEqual(48, app.items[0].quality)
    }
    
    func testBackStagePassSetsQualityToZeroWhenPastSellIn() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                        sellIn: 0,
                        quality: 45)
        let items = [item]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(item.name, app.items[0].name)
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }

    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testFoo", testFoo),
        ]
    }
}
