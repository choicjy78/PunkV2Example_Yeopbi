//
//  PunkV2DataUnitTest.swift
//  PunkV2_ExampleTests
//
//  Created by Jinyeop Choi on 2018. 12. 28..
//

import XCTest
@testable import SwiftyJSON
@testable import PunkV2_Example

class PunkV2DataUnitTest: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSONData() {
        let jsonData = PunkV2TestData().testJSON
        let modelData = Beer(data: jsonData)
        
        XCTAssertEqual(modelData.id, 1)
        XCTAssertEqual(modelData.name, "Buzz")
        XCTAssertEqual(modelData.tagline, "A Real Bitter Experience.")
        XCTAssertEqual(modelData.firstBrewed.month, "09")
        XCTAssertEqual(modelData.firstBrewed.year, "2007")
        XCTAssertEqual(modelData.description, "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.")
        XCTAssertEqual(modelData.imageURL, "https://images.punkapi.com/v2/keg.png")
        XCTAssertEqual(modelData.abv, 4.5)
        XCTAssertEqual(modelData.ibu, 60)
        XCTAssertEqual(modelData.targetFG, 1010)
        XCTAssertEqual(modelData.targetOG, 1044)
        XCTAssertEqual(modelData.ebc, 20)
        XCTAssertEqual(modelData.srm, 10)
        XCTAssertEqual(modelData.ph, 4.4)
        XCTAssertEqual(modelData.attenuationLevel, 75)
        XCTAssertEqual(modelData.foodPairing.count, 3)
        XCTAssertEqual(modelData.foodPairing[0], "Spicy chicken tikka masala")
        XCTAssertEqual(modelData.foodPairing[1], "Grilled chicken quesadilla")
        XCTAssertEqual(modelData.foodPairing[2], "Caramel toffee cake")
        XCTAssertEqual(modelData.brewersTips, "The earthy and floral aromas from the hops can be overpowering. Drop a little Cascade in at the end of the boil to lift the profile with a bit of citrus.")
        XCTAssertEqual(modelData.contributedBy, "Sam Mason <samjbmason>")
        
        // Value Unit
        XCTAssertEqual(modelData.volume.value, 20)
        XCTAssertEqual(modelData.volume.unit, .liters)
        XCTAssertEqual(modelData.boilVolume.value, 25)
        XCTAssertEqual(modelData.boilVolume.unit, .liters)
        
        // Method
        XCTAssertEqual(modelData.method.mashTemp.count, 1)
        XCTAssertEqual(modelData.method.mashTemp[0].temp.value, 64)
        XCTAssertEqual(modelData.method.mashTemp[0].temp.unit, .celsius)
        XCTAssertEqual(modelData.method.mashTemp[0].duration, 75)
        XCTAssertEqual(modelData.method.fermentationTemp.value, 19)
        XCTAssertEqual(modelData.method.fermentationTemp.unit, .celsius)
        XCTAssertEqual(modelData.method.twist, "")
        
        // Ingredients
        XCTAssertEqual(modelData.ingredients.malt.count, 3)
        XCTAssertEqual(modelData.ingredients.hops.count, 5)
        XCTAssertEqual(modelData.ingredients.yeast, "Wyeast 1056 - American Ale™")
        
        XCTAssertEqual(modelData.ingredients.malt[1].name, "Caramalt")
        XCTAssertEqual(modelData.ingredients.malt[1].amount.value, 0.2)
        XCTAssertEqual(modelData.ingredients.malt[1].amount.unit, .kilograms)
        
        XCTAssertEqual(modelData.ingredients.hops[4].name, "Cascade")
        XCTAssertEqual(modelData.ingredients.hops[4].amount.value, 37.5)
        XCTAssertEqual(modelData.ingredients.hops[4].amount.unit, .grams)
        XCTAssertEqual(modelData.ingredients.hops[4].add, "end")
        XCTAssertEqual(modelData.ingredients.hops[4].attribute, "flavour")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
