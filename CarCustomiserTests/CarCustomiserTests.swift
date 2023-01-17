//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Matteo Mountain on 15/01/2023.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet(){
        // arrange
        // act
        let car = Car(make: "Mazda", model: "MX5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        // assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    
    func testCarAttributesDisplayOnTopLeftOfScreen(){
        
        let car = Car(make: "Mazda", model: "MX5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        let output = """
                     Make: \(car.make)
                     Model: \(car.model)
                     Top Speed: \(car.topSpeed)mph
                     Acceleration (0-60): \(String(format: "%.1f", car.acceleration))s
                     Handling: \(car.handling)
                     """
        
        let expectedOutput = """
                             Make: Mazda
                             Model: MX5
                             Top Speed: 125mph
                             Acceleration (0-60): 7.7s
                             Handling: 5
                             """
        XCTAssertEqual(output, expectedOutput)
    
    }
    
}
