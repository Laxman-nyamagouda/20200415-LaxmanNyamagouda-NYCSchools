//
//  SATResultsAPIHelperTest.swift
//  20200415-LaxmanNyamagouda-NYCSchoolsTests
//
//  Created by Laxman on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation


import XCTest

class SATResultsAPIHelperTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSATResultsAPIService() {
        
        // Create an expectation call
        let expectation = XCTestExpectation(description: "School list API call")
        
        // Call School List API Mock Request task
        guard let url = Constants().satScoreUrl else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let _ = data,
                 error == nil else {
                     XCTAssertNotNil("SAT Results API response returned nil.")
                     return
             }
             expectation.fulfill()
         }
         task.resume()
    }
    
    func callSATResultsAPIMockRequest() {
        //If mock request required
    }
    
    func testExample() {
         // This is an example of a functional test case.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
     }

     func testPerformanceExample() {
         // This is an example of a performance test case.
         self.measure {
             // Put the code you want to measure the time of here.
         }
     }

}
