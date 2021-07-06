//
//  StarWarsServiceTest.swift
//  Ravn-Challenge-V2-DanielCornejoTests
//
//  Created by Daniel Cornejo on 7/5/21.
//

import Combine
import XCTest
@testable import Ravn_Challenge_V2_DanielCornejo

class StarWarsServiceTest: XCTestCase {
    
    func testFetchFirstPeople() {
        // Given
        let service = ApolloServiceMock()
        let starWarsService = StarWarsService(service: service)
        let expectation = XCTestExpectation(description: "Fetch First People")
        
        // When
        let result = starWarsService.fetchFirstPeople()
        
        // Then
        let cancellable = result
            .sink { _ in
                expectation.fulfill()
            } receiveValue: { response in
                XCTAssertTrue(response.pageInfo.hasNextPage ?? true)
                XCTAssertEqual(3, response.people?.count ?? 0)
                XCTAssertEqual("Human01", response.people?.first?.name)
            }
        
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertNotNil(cancellable)
    }
    
}
