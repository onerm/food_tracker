//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Onésimo Ramos Magallón on 01/08/16.
//  Copyright © 2016 Onésimo Ramos Magallón. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    // MARK: FoodTracker Tests
    // Test to confirm that the Meal initializer returns when no name or a negative rating is provided
    func testMealInitialization() {
        // Success case.
        let potencialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potencialItem)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
    
}
